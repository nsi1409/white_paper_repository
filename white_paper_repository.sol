pragma solidity >=0.7.0 <0.9.0;

contract white_paper_repository {
    address payable public Owner;
    struct Paper{
        string title;
        string content;
        string metadata;
        address owner;
    }
    Paper[] public minted_paper;
    uint price = 0.25 ether;

    constructor () public { 
        Owner = payable(msg.sender);
    }

    function check_owner() public {
        require(payable(msg.sender) == Owner, 'Not owner'); 
    }

    function set_price(uint price_inpt) public {
        check_owner();
        price = price_inpt;
    }

    function purchase(string memory title, string memory content, string memory metadata, address owner) public {
        Paper memory new_paper = Paper(title, content, metadata, owner);
        minted_paper.push(new_paper);
    }

    function retrieve(string memory title) public view returns (Paper memory) {
        Paper memory null_paper = Paper("null", "null", "null", Owner);
        for (uint i=0; i<minted_paper.length; i++) {
            if(keccak256(bytes(minted_paper[i].title)) == keccak256(bytes(title))) {
                return minted_paper[i];
            }
        }
        return null_paper;
    }
}
