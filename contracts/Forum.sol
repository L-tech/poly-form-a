//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";

contract Forum {
    
    struct Post {
        uint32 id;
        string topic;
        string message;
        address creator_address;
        uint256 created_at;
    }

    mapping(string => Post[]) postsByTopic;

    uint32 private idCounter;

    IERC721 public polyAbjNFT;


    event PostAdded(Post post);

    constructor(address _nft) public {
        polyAbjNFT = IERC721(_nft);
    }

    function getPosts(string calldata topic) public view returns (Post[] memory) {
        return postsByTopic[topic];
    }

    function addPost(string calldata topic, string calldata message) public {
        require(polyAbjNFT.balanceOf(msg.sender) > 0, "you dont have an nft");
        Post memory post = Post({
            id: idCounter,
            topic: topic,
            message: message,
            created_at: block.timestamp,
            creator_address: msg.sender

        });
        postsByTopic[topic].push(post);
        idCounter++;

    }

}