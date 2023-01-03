pragma solidity >=0.7.0 <0.9.0;

contract white_paper_repository {

    string white_paper;

    function store(string memory txt) public {
        white_paper = txt;
    }

    function retrieve() public view returns (string memory){
        return white_paper;
    }
}
