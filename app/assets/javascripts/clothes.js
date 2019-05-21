document.addEventListener('turbolinks:load', function() {
    if (document.getElementById('body').className == 'clothes settings') {
        new Vue({
            el: '#settingsForm',
            data: {
                formData: {
                    gender: undefined,
                    category: undefined,
                    websites: []
                },
                formErrors: [],
                genders: [],
                categories: [],
                websites: []
            },
            computed: {
                matchedCategories() {
                    return _.filter(this.categories, function(category) {
                        return category.gender_id == this.formData.gender
                    }.bind(this))
                },
                selectedCategory() {
                    return this.formData.category
                }
            },
            watch: {
                selectedCategory() {
                    console.log('selectedCategory')
                    this.fetchWebsites()
                }
            },
            created() {
                var settingsForm = document.getElementById('settingsForm')
                this.genders = JSON.parse(settingsForm.dataset.genders)
                this.categories = JSON.parse(settingsForm.dataset.categories)

                // no longer filling

                this.formData.category =  Cookies.get('category')
                this.formData.gender = Cookies.get('gender')
                this.formData.websites = Cookies.get('websites')
            },
            methods: {
                clickGender: function() {
                    this.formData.category = null;
                    this.websites = []
                },
                fetchWebsites: function() {
                    let request = new Request(
                        '/clothes/website_match',
                        {
                            method: 'POST',
                            body: JSON.stringify({'category': this.formData.category}),
                            headers: new Headers({
                                'Content-Type': 'application/json'
                            })
                        }
                    )
                    fetch(request)
                    .then((res) => res.json())
                    .then((json) => {                       
                        this.websites = json.websites
                        this.fillWebsites()
                    })
                },
                fillWebsites: function() {
                    var self = this
                    var websiteCopy = self.formData.websites
                    console.log(self.websites)
                    console.log(websiteCopy)
                    self.formData.websites = []
                    _.forEach(websiteCopy, function(websiteId) {
                        _.some(self.websites, ['id', websiteId]) ? self.formData.websites.push(websiteId) : ''
                    })
                },
                clickFormSubmit: function() {
                    if (this.formIsValid()) {
                        Cookies.set('gender', this.formData.gender)
                        Cookies.set('category', this.formData.category)
                        Cookies.set('websites', JSON.stringify(this.formData.websites))
                        window.location = "/";   
                    }
                },
                formIsValid: function() {
                    if (this.formData.gender && this.formData.category && this.formData.websites.length) {
                        return true;
                    }

                    this.formErrors = [];
                    !this.formData.gender ? this.formErrors.push('Gender required') : ''
                    !this.formData.category ? this.formErrors.push('Category required') : ''
                    !this.formData.websites.length ? this.formErrors.push('At least one website is required') : ''
                }
            }
        })
    } else if (document.getElementById('body').className == 'clothes index') {
        new LazyLoad({elements_selector: ".lazy"});
    }
})