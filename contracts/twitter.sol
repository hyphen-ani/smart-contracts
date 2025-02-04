// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Twitter{

    uint16 MAX_TWEET_LENGTH = 280;
    address public owner;

    constructor(){
        owner = msg.sender;
    }

    struct Tweet{
        uint id;
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;
    }

    mapping(address => Tweet[]) public tweets;


    event TweetCreated(uint indexed id, address author, string content, uint timestamp);
    event TweetLiked(address liker, address tweetAuthor, uint indexed tweetId, uint newLikeCount);
    event TweetDisliked(address disliker, address tweetAuthor, uint indexed tweetId, uint newLikeCount);

    modifier onlyOwner(){
        require(msg.sender == owner, "You are not the owner");
        _;
    }

    function changeTweetLength(uint16 newTweetLength) public onlyOwner  {
            MAX_TWEET_LENGTH = newTweetLength;
    }

    function createTweet(string memory _tweet) public{

        require(bytes(_tweet).length <= MAX_TWEET_LENGTH, "Tweet too long to post.");

        Tweet memory newTweet = Tweet({
            id: tweets[msg.sender].length,
            author: msg.sender,
            content: _tweet,
            timestamp: block.timestamp,
            likes: 0
        });


        tweets[msg.sender].push(newTweet);

        emit TweetCreated(newTweet.id, newTweet.author, newTweet.content, newTweet.timestamp);
    }

    function likeTweet(uint id, address author) external {
        require(tweets[author][id].id == id, "TWEET DOESNT EXIST");
        uint updatedLikes = tweets[author][id].likes++;

        emit TweetLiked(msg.sender, author, id, updatedLikes);
    }

    function dislikeTweet(uint id, address author) external{
        require(tweets[author][id].id == id, "TWEET DOENST EXIST");
        require(tweets[author][id].likes > 0, "CANNOT DISLIKE");
        
        uint updatedLikes = tweets[author][id].likes--;

        emit TweetDisliked(msg.sender, author, id, updatedLikes);
    }

    function get(uint _i) view public returns(Tweet memory){
        return tweets[msg.sender][_i];
    }

    function getAllTweets() public view returns(Tweet[] memory){
        return tweets[msg.sender];
    }
}