// contracts/BankingSystem.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BankingSystem {
    struct User {
        address userAddress;
        string name;
        string demographicData;
        bytes32 uniqueKey;
        bool isNewUser;
    }

    struct Transaction {
        uint256 id;
        address from;
        address to;
        uint256 amount;
        uint256 timestamp;
    }

    struct Loan {
        uint256 id;
        address user;
        uint256 amount;
        string status; // Pending, Approved, Rejected
        uint256 timestamp;
    }

    struct Bank {
        address bankAddress;
        string name;
        address manager;
        address[] employees;
        User[] users;
        Transaction[] transactions;
        Loan[] loans;
    }

    mapping(address => Bank) public banks;
    mapping(address => bool) public isEmployee;
    mapping(address => bool) public isManager;

    event UserAdded(address bank, address user);
    event TransactionAdded(address bank, uint256 transactionId);
    event LoanRequested(address bank, uint256 loanId);
    event LoanDecided(address bank, uint256 loanId, string status);

    // Register a new bank
    function registerBank(address _manager, string memory _name) public {
        require(banks[msg.sender].bankAddress == address(0), "Bank already registered");
        banks[msg.sender].bankAddress = msg.sender;
        banks[msg.sender].manager = _manager;
        banks[msg.sender].name = _name;
        isManager[_manager] = true;
    }

    // Add an employee to a bank
    function addEmployee(address _bank, address _employee) public {
        require(msg.sender == banks[_bank].manager, "Only manager can add employees");
        banks[_bank].employees.push(_employee);
        isEmployee[_employee] = true;
    }

    // Add a user
    function addUser(
        address _bank,
        address _userAddress,
        string memory _name,
        string memory _demographicData,
        bool _isNewUser
    ) public {
        require(
            isManager[msg.sender] || isEmployee[msg.sender],
            "Only manager or employee can add users"
        );
        bytes32 uniqueKey = sha256(abi.encodePacked(_userAddress, _bank));
        banks[_bank].users.push(
            User({
                userAddress: _userAddress,
                name: _name,
                demographicData: _demographicData,
                uniqueKey: uniqueKey,
                isNewUser: _isNewUser
            })
        );
        emit UserAdded(_bank, _userAddress);
    }

    // Add a transaction
    function addTransaction(
        address _bank,
        address _from,
        address _to,
        uint256 _amount
    ) public {
        require(
            isManager[msg.sender] || isEmployee[msg.sender],
            "Only manager or employee can add transactions"
        );
        uint256 txId = banks[_bank].transactions.length;
        banks[_bank].transactions.push(
            Transaction({
                id: txId,
                from: _from,
                to: _to,
                amount: _amount,
                timestamp: block.timestamp
            })
        );
        emit TransactionAdded(_bank, txId);
    }

    // Request a loan
    function requestLoan(
        address _bank,
        address _user,
        uint256 _amount
    ) public {
        require(
            isManager[msg.sender] || isEmployee[msg.sender],
            "Only manager or employee can request loans"
        );
        uint256 loanId = banks[_bank].loans.length;
        banks[_bank].loans.push(
            Loan({
                id: loanId,
                user: _user,
                amount: _amount,
                status: "Pending",
                timestamp: block.timestamp
            })
        );
        emit LoanRequested(_bank, loanId);
    }

    // Manager decides on a loan
    function decideLoan(
        address _bank,
        uint256 _loanId,
        string memory _status
    ) public {
        require(msg.sender == banks[_bank].manager, "Only manager can decide on loans");
        require(
            _loanId < banks[_bank].loans.length,
            "Loan ID does not exist"
        );
        banks[_bank].loans[_loanId].status = _status;
        emit LoanDecided(_bank, _loanId, _status);
    }

    // Get users of a bank
    function getUsers(address _bank) public view returns (User[] memory) {
        require(
            isManager[msg.sender] || isEmployee[msg.sender],
            "Only manager or employee can view users"
        );
        return banks[_bank].users;
    }

    // Get transactions of a bank
    function getTransactions(address _bank) public view returns (Transaction[] memory) {
        require(
            isManager[msg.sender] || isEmployee[msg.sender],
            "Only manager or employee can view transactions"
        );
        return banks[_bank].transactions;
    }

    // Get loans of a bank
    function getLoans(address _bank) public view returns (Loan[] memory) {
        require(
            isManager[msg.sender] || isEmployee[msg.sender],
            "Only manager or employee can view loans"
        );
        return banks[_bank].loans;
    }
}
