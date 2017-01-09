<template>
    <div style="height: 100%;">
        <section class="section">
            <div class="content">
                <p class="heading">PHARMACEUTICALS</p>
                <label class="label">Address</label>
                <p class="control">
                    <input class="input" type="text" placeholder="Text input" v-model="manufacturer">
                </p>
                <a class="button is-info" @click="licenseManufacturer">Register</a> <a class="button is-danger"
                                                                                       @click="revokeManufacturer">Revoke</a>

                <br/><br/>

                <p class="heading">DRUG REGULATORS</p>
                <label class="label">Address</label>
                <p class="control">
                    <input class="input" type="text" placeholder="Text input" v-model="regulator">
                </p>
                <a class="button is-info" @click="licenseRegulator">Register</a> <a class="button is-danger"
                                                                                    @click="revokeRegulator">Revoke</a>
            </div>
        </section>
    </div>
</template>

<style>

</style>

<script>
    import swal from "sweetalert2";
    import "sweetalert2/dist/sweetalert2.css";
    import Datdrug from "./datdrug";

    export default {
        data: () => {
            return {
                manufacturer: '',
                regulator: ''
            }
        },
        methods: {
            licenseManufacturer() {
                const self = this;

                swal({
                    title: 'Are you sure?',
                    showCancelButton: true,
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, register!',
                    showLoaderOnConfirm: true,
                    preConfirm: function (email) {
                        return new Promise(function (resolve, reject) {
                            Datdrug.instance.licensePharma(self.manufacturer, (err, res) => {
                                if (!err) {
                                    console.log(res)
                                    resolve();
                                } else {
                                    reject("Failed to license.");
                                }
                            })
                        })
                    },
                    allowOutsideClick: false
                }).then(function (email) {
                    swal({
                        type: 'success',
                        title: 'Registered!',
                        html: 'Registered pharmaceutical: ' + self.manufacturer
                    })
                })
            },
            revokeManufacturer() {
                const self = this;

                swal({
                    title: 'Are you sure?',
                    showCancelButton: true,
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, revoke!',
                    showLoaderOnConfirm: true,
                    preConfirm: function (email) {
                        return new Promise(function (resolve, reject) {
                            Datdrug.instance.banPharma(self.manufacturer, (err, res) => {
                                if (!err) {
                                    console.log(res)
                                    resolve();
                                } else {
                                    console.error(err);
                                    reject("Failed to ban.");
                                }
                            })
                        })
                    },
                    allowOutsideClick: false
                }).then(function (email) {
                    swal({
                        type: 'success',
                        title: 'Banned!',
                        html: 'Banned pharmaceutical: ' + self.manufacturer
                    })
                })
            },
            licenseRegulator() {
                const self = this;

                swal({
                    title: 'Are you sure?',
                    showCancelButton: true,
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, register!',
                    showLoaderOnConfirm: true,
                    preConfirm: function (email) {
                        return new Promise(function (resolve, reject) {
                            Datdrug.instance.licenseRegulator(self.regulator, (err, res) => {
                                if (!err) {
                                    console.log(res)
                                    resolve();
                                } else {
                                    reject("Failed to license.");
                                }
                            })
                        })
                    },
                    allowOutsideClick: false
                }).then(function (email) {
                    swal({
                        type: 'success',
                        title: 'Registered!',
                        html: 'Registered regulator: ' + self.regulator
                    })
                })
            },
            revokeRegulator() {
                const self = this;

                swal({
                    title: 'Are you sure?',
                    showCancelButton: true,
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, ban!',
                    showLoaderOnConfirm: true,
                    preConfirm: function (email) {
                        return new Promise(function (resolve, reject) {
                            Datdrug.instance.banRegulator(self.regulator, (err, res) => {
                                if (!err) {
                                    console.log(res)
                                    resolve();
                                } else {
                                    reject("Failed to ban.");
                                }
                            })
                        })
                    },
                    allowOutsideClick: false
                }).then(function (email) {
                    swal({
                        type: 'success',
                        title: 'Banned!',
                        html: 'Banned regulator: ' + self.regulator
                    })
                })
            }
        },
        components: {}
    }
</script>
