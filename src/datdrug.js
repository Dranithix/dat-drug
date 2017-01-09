/**
 * Created by Kenta Iwasaki on 1/9/2017.
 */

class Datdrug {
    ipfs = {}
    web3 = {}
    contract = {}
    instance = {}

    init(ipfs, web3) {
        this.ipfs = ipfs;
        this.web3 = web3;
    }

    defineContract() {
        this.contract = this.web3.eth.contract([{"constant":false,"inputs":[{"name":"regulator","type":"address"}],"name":"licenseRegulator","outputs":[{"name":"","type":"bool"}],"payable":false,"type":"function"},{"constant":false,"inputs":[{"name":"pharma","type":"address"}],"name":"banPharma","outputs":[{"name":"","type":"bool"}],"payable":false,"type":"function"},{"constant":false,"inputs":[{"name":"index","type":"uint256"}],"name":"getDrugBatchHash","outputs":[{"name":"","type":"string"}],"payable":false,"type":"function"},{"constant":false,"inputs":[{"name":"regulator","type":"address"}],"name":"banRegulator","outputs":[{"name":"","type":"bool"}],"payable":false,"type":"function"},{"constant":false,"inputs":[{"name":"hash","type":"string"}],"name":"addDrugBatch","outputs":[{"name":"","type":"bool"}],"payable":false,"type":"function"},{"constant":true,"inputs":[{"name":"","type":"uint256"}],"name":"regulators","outputs":[{"name":"","type":"address"}],"payable":false,"type":"function"},{"constant":false,"inputs":[{"name":"hash","type":"string"}],"name":"licenseDrugBatch","outputs":[{"name":"","type":"bool"}],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"drugCount","outputs":[{"name":"","type":"uint256"}],"payable":false,"type":"function"},{"constant":true,"inputs":[{"name":"","type":"uint256"}],"name":"drugIndices","outputs":[{"name":"","type":"string"}],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"owner","outputs":[{"name":"","type":"address"}],"payable":false,"type":"function"},{"constant":false,"inputs":[{"name":"pharma","type":"address"}],"name":"licensePharma","outputs":[{"name":"","type":"bool"}],"payable":false,"type":"function"},{"constant":false,"inputs":[],"name":"permissions","outputs":[{"name":"","type":"uint256"}],"payable":false,"type":"function"},{"constant":false,"inputs":[{"name":"hash","type":"string"}],"name":"drugBatchVerified","outputs":[{"name":"","type":"bool"}],"payable":false,"type":"function"},{"constant":true,"inputs":[{"name":"","type":"uint256"}],"name":"pharmas","outputs":[{"name":"","type":"address"}],"payable":false,"type":"function"},{"inputs":[],"payable":false,"type":"constructor"},{"anonymous":false,"inputs":[{"indexed":false,"name":"id","type":"string"}],"name":"NewDrugBatch","type":"event"}]);
    }

    setupContract(callback) {
        this.defineContract();
        this.instance = this.contract.at("0xd52926152bf6292a115b0f83267677ca8ddb770b");
        callback(1);
    }
}

const instance = new Datdrug();
export default instance;