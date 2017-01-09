pragma solidity ^0.4.7;

contract DatDrug {
	struct DrugBatch {
	    bool exists;
	    address pharma;
		address regulator;
	}

    address public owner;
    address[] public pharmas;
    address[] public regulators;

    mapping(string => DrugBatch) drugs;
    mapping(uint => string) public drugIndices;
    uint public drugCount;

    modifier isOwner {
        if (msg.sender == owner) _;
    }

    modifier isLicensed {
        for (uint i = 0; i < pharmas.length; i++) if (msg.sender == pharmas[i]) _;
    }

    modifier isRegulator {
        for (uint i = 0; i < regulators.length; i++) if (msg.sender == regulators[i]) _;
    }

    event NewDrugBatch(string id);

    function DatDrug() {
        owner = msg.sender;
    }

    function licensePharma(address pharma) isOwner returns(bool) {
        for (uint i = 0; i < pharmas.length; i++) if (pharma == pharmas[i]) return false;
        pharmas[pharmas.length++] = pharma;
        return true;
    }

    function permissions() returns(uint) {
        if (owner == msg.sender) return 0;
        for (uint i = 0; i < pharmas.length; i++) if (msg.sender == pharmas[i]) return 1;
        for (i = 0; i < regulators.length; i++) if (msg.sender == regulators[i]) return 2;
        return 3;
    }

    function banPharma(address pharma) isOwner returns(bool) {
        // Edge case: If there is only 1 regulator, simply delete them.
        if (pharmas.length == 1 && pharmas[0] == pharma) {
            delete pharmas[0];
            pharmas.length--;
            return true;
        }

        // Delete regulator and fill in gap with last regulator in array.
        for (uint i = 0; i < pharmas.length; i++) {
            if (pharmas[i] == pharma) {
                pharmas[i] = pharmas[pharmas.length - 1];
                delete pharmas[pharmas.length - 1];
                pharmas.length--;
                return true;
            }
        }
        return false;
    }

    function licenseRegulator(address regulator) isOwner returns(bool) {
        for (uint i = 0; i < regulators.length; i++) if (regulator == regulators[i]) return false;
        regulators[regulators.length++] = regulator;
        return true;
    }

    function banRegulator(address regulator) isOwner returns(bool) {
        // Edge case: If there is only 1 regulator, simply delete them.
        if (regulators.length == 1 && regulators[0] == regulator) {
            delete regulators[0];
            regulators.length--;
            return true;
        }

        // Delete regulator and fill in gap with last regulator in array.
        for (uint i = 0; i < regulators.length; i++) {
            if (regulators[i] == regulator) {
                regulators[i] = regulators[regulators.length - 1];
                delete regulators[regulators.length - 1];
                regulators.length--;
                return true;
            }
        }
        return false;
    }

    function addDrugBatch(string hash) isLicensed returns(bool) {
        if (drugs[hash].exists) return false;

        drugs[hash].pharma = msg.sender;
        drugs[hash].exists = true;
        drugIndices[drugCount++] = hash;
        NewDrugBatch(hash);
        return true;
    }

    function getDrugBatchHash(uint index) returns(string) {
        return drugIndices[index];
    }

    function licenseDrugBatch(string hash) isRegulator returns(bool) {
        if (!drugs[hash].exists) return false;
        drugs[hash].regulator = msg.sender;
        return true;
    }

    function drugBatchVerified(string hash) returns(bool) {
        // Check if the batch exists.
        if (!drugs[hash].exists) return false;

        // Check if batch is unverified by a regulator.
        if (drugs[hash].regulator == address(0x0)) return false;

        // Check if the regulator is authorized.
        for (uint i = 0; i < regulators.length; i++) if (regulators[i] == drugs[hash].regulator) return true;

        return false;
    }


}