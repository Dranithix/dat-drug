<template>
    <div>
        <section class="section" style="height: 100%;">
            <div class="content">
                <h4>DatDrug&copy Drug Batch Certificate Generator</h4>

                <h5><u>Basic Information</u></h5>
                <div class="columns">
                    <div class="column is-half">
                        <label class="label">Number of certificates</label>
                        <input v-model.number="form.numCertificates" class="input is-fullwidth" type="number" min="0"
                               id="numberofcertificate">
                    </div>
                    <div class="column is-half">
                        <label class="label">Importing (requesting) authority</label>
                        <input v-model.trim="form.importingAuthority" class="input is-fullwidth" type="text"
                               id="importingauthority">
                    </div>
                </div>

                <h5><u>Product Information</u></h5>

                <p class="control">
                    <label class="label">Name of product</label>
                    <input v-model.trim="form.productName" class="input is-fullwidth" type="text" id="nameofproduct">
                </p>

                <p class="control">
                    <label class="label">Dosage form, active ingredient(s) and amount(s) per unit
                        dose</label>
                    <textarea v-model.trim="form.dosageForm" class="textarea is-fullwidth"
                              placeholder="Use, whenever possible, International Nonproprietary Names (INNs) or national nonproprietary names."
                              id="dosageform"></textarea>
                </p>

                <p class="control">
                    <input type="checkbox" v-model.trim="form.compositionIdentical" id="compositionofproductidentical">
                    <label class="checkbox">Is the composition of the product identical to that registered in the
                        country of export?</label>
                </p>
                <textarea v-model.trim="form.alternateComposition" class="textarea is-full-width"
                          placeholder="If no: please attach formula (including excipients) of both products."
                          id="compositionnotidentical"></textarea>

                <br/>

                <h5><u>Product Licence Information</u></h5>

                <p>All items in this section refer to the product licence or the Certificate of a
                    Pharmaceutical Product issued in the exporting country.</p>

                <p class="control">
                    <label class="label">Product-licence holder (name and address)</label>
                    <input v-model.trim="form.productLicenseHolder" class="is-full-width input" type="text"
                           placeholder="ex. Mr. John Adam Smith"
                           id="productlicenceholder">
                </p>

                <div class="columns">
                    <div class="column is-half">
                        <label class="label">Product licence number</label>
                        <input v-model.number="form.productLicenseNum" class="input is-fullwidth" type="number" min="0"
                               id="productlicencenumber">
                    </div>
                    <div class="column is-half">
                        <label class="label">Date of issue</label>
                        <input v-model.trim="form.productLicenseIssueDate" class="input is-fullwidth" type="date"
                               id="dateofissue">
                    </div>
                </div>

                <div class="columns">
                    <div class="column is-half">
                        <label class="label">Product licence issued by</label>
                        <input v-model.trim="form.productLicenseIssuer" class="input is-fullwidth" type="text"
                               id="productlicenceissuedby">
                    </div>
                    <div class="column is-half">
                        <label class="label">Product certificate number</label>
                        <input v-model.number="form.productCertificateNum" class="input is-fullwidth" type="number"
                               min="0" id="productcertificatenumber">
                    </div>
                </div>

                <h5><u>Batch Information</u></h5>
                <div class="columns">
                    <div class="column is-half">
                        <label class="label">Batch number</label>
                        <input v-model.number="form.batchNum" class="input is-fullwidth" type="number" id="batchnumber">
                    </div>
                    <div class="column is-half">
                        <label class="label">Date of manufacture</label>
                        <input v-model.trim="form.manufactureDate" class="input is-fullwidth" type="date"
                               id="dateofmanufacture">
                    </div>
                </div>

                <div class="columns">
                    <div class="column is-half">
                        <label class="label">Shelf life (years)</label>
                        <input v-model.number="form.shelfLife" class="input is-fullwidth" type="number" min="0"
                               step="0.1"
                               placeholder="ex. 2.1" id="shelflife">
                    </div>
                    <div class="column">
                        <label label="label">Contents of container</label>
                        <input v-model.trim="form.containerContents" class="input is-fullwidth" type="text"
                               id="contentsofcontainer">
                    </div>
                </div>

                <div class="columns">
                    <div class="column is-half">
                        <label class="label">Nature of primary container</label>
                        <input v-model.trim="form.primaryContainerNature" class="input is-fullwidth" type="text"
                               id="natureofprimarycontainer">
                    </div>
                    <div class="column is-half">
                        <label class="label">Nature of secondary
                            container/wrapping</label>
                        <input v-model.trim="form.secondaryContainerNature" class="input is-fullwidth" type="text"
                               id="natureofsecondarycontainer">
                    </div>
                </div>

                <div class="columns">
                    <div class="is-8 column">
                        <label class="label">Specific storage conditions</label>
                        <input v-model.trim="form.storageConditions" class="input is-fullwidth" type="text"
                               id="specificstorageconditions">
                    </div>
                    <div class="is-4 column">
                        <label class="label">Temperature range</label>
                        <input v-model.trim="form.temperatureRange" class="input is-fullwidth" type="text"
                               id="temperaturerange">
                    </div>
                </div>

                <p class="control">
                    <label class="label">Remarks</label>
                    <textarea v-model.trim="form.storageRemarks" class="textarea is-fullwidth"
                              placeholder="Indicate any special storage conditions recommended for the product as supplied."
                              id="remarks"></textarea>
                </p>

                <h5><u>Quality Analysis</u></h5>

                <p class="control">
                    <label class="label">What specifications apply to this dosage form?
                        Either specify the pharmacopoeia or append company specifications.</label>
                    <textarea v-model.trim="form.qualityAssurance" class="textarea is-fullwidth"
                              placeholder="For each of the parameters to be measured, specifications give the values that have been accepted for batch release at the time of product registration."
                              id="dosageformspecifications"></textarea>
                </p>

                <p class="control">
                    <label class="checkbox">
                        <input v-model.trim="form.authorityApproved" type="checkbox">
                        <span class="label-body">In the case of a product registered in the exporting country, have these company specifications been accepted by the competent authority?</span>
                    </label>
                </p>

                <p class="control">
                    <label class="checkbox">
                        <input v-model.trim="form.complianceConfirmation" type="checkbox" required>
                        <span class="label-body">Does the batch comply with all parts of the above specifications?</span>
                    </label>
                </p>

                <p class="control">
                    <label class="label">Append certificate of analysis</label>
                    <textarea v-model.trim="form.analysis" class="textarea is-fullwidth"
                              placeholder="Identify and explain any discrepancies from specifications. Government batch release certificates issued by certain governmental authorities for specific biological products provide additional confirmation that a given batch has been released, without necessarily giving the results of testing. The latter are contained in the manufacturer's certificate of analysis."
                              id="certificateofanalysis"></textarea>
                </p>

                <h5><u>Confirmation</u></h5>
                <p>It is hereby certified that the above declarations are correct and that the results
                    of the analyses and assays on which they are based will be provided on request to
                    the competent authorities in both the importing and exporting countries.</p>

                <p class="control">
                    <label class="label">Name and address of authorized person</label>
                    <input v-model.trim="form.authorizedPerson" class="input is-fullwidth" type="text"
                           id="sauthorizedperson">
                </p>

                <div class="columns">
                    <div class="column is-half">
                        <label class="label">Telephone no.</label>
                        <input v-model.number="form.telephoneNum" class="input is-fullwidth" type="number" min="0"
                               id="authorizedpersontelephone">
                    </div>
                    <div class="column is-half">
                        <label class="label">Fax no.</label>
                        <input v-model.number="form.faxNum" class="input is-fullwidth" type="number" min="0"
                               id="authorizedpersonfax">
                    </div>
                </div>


                <p class="control">
                    <label class="label">Explanatory notes</label>

                <p>Certification of individual batches of a pharmaceutical product is only undertaken
                    exceptionally by the competent authority of the exporting country. Even then, it is
                    rarely applied other than to vaccines, sera and biologicals. For other products, the
                    responsibility for any requirement to provide batch certificates rests with the
                    product-licence holder in the exporting country. The responsibility to forward
                    certificates to the competent authority in the importing country is most
                    conveniently assigned to the importing agent.</p>
                <p>Any inquiries or complaints regarding a batch certificate should always be addressed
                    to the competent authority in the exporting country. A copy should be sent to the
                    product- licence holder.</p>
                </p>
                <a class="button is-primary is-fullwidth" @click="submitBatch">Submit</a>
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
                form: {
                    numCertificates: 0,
                    importingAuthority: "",
                    productName: "",
                    dosageForm: "",
                    compositionIdentical: false,
                    alternateComposition: "",
                    productLicenseHolder: "",
                    productLicenseNum: "",
                    productLicenseIssueDate: "",
                    productLicenseIssuer: "",
                    productCertificateNum: "",
                    batchNum: 0,
                    manufactureDate: "",
                    shelfLife: 1,
                    containerContents: "",
                    primaryContainerNature: "",
                    secondaryContainerNature: "",
                    storageConditions: "",
                    temperatureRange: "",
                    storageRemarks: "",
                    qualityAssurance: "",
                    authorityApproved: false,
                    complianceConfirmation: false,
                    analysis: "",
                    authorizedPerson: "",
                    telephoneNum: "",
                    faxNum: ""
                }
            }
        },
        methods: {
            submitBatch() {
                const formData = this.form;
                Datdrug.ipfs.add(new Buffer(JSON.stringify(formData)), (err, res) => {
                    if (err || !res) {
                        swal("Error!", "It seems that an issue occurred registering the batch. Please try again.", "error");
                    } else {
                        const file = res[0].hash; // Path available too.

                        const success = Datdrug.instance.addDrugBatch.call(file);
                        if (success) {
                            const link = `https://api.qrserver.com/v1/create-qr-code/?size=300x300&data=DATDRUG|${file}`;
                            swal({
                                type: 'success',
                                title: 'Registered!',
                                html: `Registered the drug batch under IPFS hash: <code>${file}</code><br/><br/><a href="${link}" download="qr.png"><img src="${link}"/></a>`
                            })
                        }

                    }
                })
            }
        }
    }
</script>