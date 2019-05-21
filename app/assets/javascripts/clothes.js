document.addEventListener('turbolinks:load', function() {
    if (document.getElementById('body').className == 'clothes settings') {
        new Vue({
            el: '#settingsForm',
            data: {
                formData: {
                    gender: '',
                    category: '',
                    websites: []
                },
                formErrors: [],
                genders: [],
                categories: [],
                websites: []
            },
            computed: {
                selectedCategory() {
                    return this.formData.category
                }
            },
            watch: {
                selectedCategory() {
                    this.fetchWebsites()
                }
            },
            created() {
                var settingsForm = document.getElementById('settingsForm')
                this.genders = JSON.parse(settingsForm.dataset.genders)
                this.categories = JSON.parse(settingsForm.dataset.categories)
                this.formData = this.parseCookies()
                this.fetchWebsites()
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
                    self.formData.websites = []
                    _.forEach(websiteCopy, function(websiteId) {
                        _.some(self.websites, ['id', websiteId]) ? self.formData.websites.push(websiteId) : ''
                    })
                },
                clickFormSubmit: function() {
                    if (this.formIsValid()) {
                        var path = ';path=/'
                        document.cookie = "gender=" + this.formData.gender + path;
                        document.cookie = "category=" + this.formData.category + path;
                        document.cookie = "websites=" + encodeURIComponent(JSON.stringify(this.formData.websites)) + path;
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
                },
                parseCookies: function() {
                    return document.cookie
                        .split(';')
                        .reduce((res, c) => {
                            const [key, val] = c.trim().split('=').map(decodeURIComponent)
                            const allNumbers = str => /^\d+$/.test(str);
                            try {
                                return Object.assign(res, {
                                    [key]: allNumbers(val) ? val : JSON.parse(val)
                                })
                            } catch (e) {
                                return Object.assign(res, {
                                    [key]: val
                                })
                            }
                        }, {});
                }
            }
        })
    } else if (document.getElementById('body').className == 'clothes index') {
        new LazyLoad({elements_selector: ".lazy"});
    }
})