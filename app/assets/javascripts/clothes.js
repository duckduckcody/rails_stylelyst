document.addEventListener('turbolinks:load', function() {
    if (document.getElementById('body').className == 'clothes settings') {
        new Vue({
            el: '#settingsForm',
            data: {
                formData: {},
                formErrors: [],
                genders: [],
                categories: [],
                websites: []
            },
            created() {
                let request = new Request(
                    '/clothes/website_match',
                    {
                        method: 'POST',
                        headers: new Headers({
                            'Content-Type': 'application/json'
                        })
                    }
                )
                fetch(request)
                .then((res) => {
                    console.log(res)
                })

                var settingsForm = document.getElementById('settingsForm')
                this.genders = JSON.parse(settingsForm.dataset.genders)
                this.categories = JSON.parse(settingsForm.dataset.categories)
                this.websites = JSON.parse(settingsForm.dataset.websites)
                this.formData = this.parseCookies()
            },
            methods: {
                clickGender: function() {
                    this.formData.category = null;
                },
                clickFormSubmit: function() {
                    if (this.formIsValid()) {
                        var path = ';path=/'
                        document.cookie = "gender=" + this.formData.gender + path;
                        document.cookie = "category=" + this.formData.category + path;
                        document.cookie = "websites=" + encodeURIComponent(JSON.stringify(this.formData.websites)) + path;
                        window.location = "/clothes";   
                    }
                },
                formIsValid: function() {
                    if (this.formData.gender && this.formData.category) {
                        return true;
                    }

                    this.formErrors = [];
                    !this.formData.gender ? this.formErrors.push('Gender required') : ''
                    !this.formData.category ? this.formErrors.push('Category required') : ''
                    !this.formData.websites ? this.formErrors.push('Atleast one website is required') : ''
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