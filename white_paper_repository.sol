pragma solidity >=0.7.0 <0.9.0;

contract white_paper_repository {
    struct Paper{
        string title;
        string content;
        string metadata;
    }
    Paper[] public minted_paper;

    function store(string memory title, string memory content, string memory metadata) public {
        Paper memory new_paper = Paper(title, content, metadata);
        minted_paper.push(new_paper);
    }

    function retrieve(string memory title) public view returns (Paper memory) {
        Paper memory null_paper = Paper("null", "null", "null");
        for (uint i=0; i<minted_paper.length; i++) {
            if(keccak256(bytes(minted_paper[i].title)) == keccak256(bytes(title))) {
                return minted_paper[i];
            }
        }
        return null_paper;
    }
}
