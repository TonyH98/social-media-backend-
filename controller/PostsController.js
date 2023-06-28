const express = require("express")

const {getAllPosts, createPost, updatePost, deletePosts} = require("../queries/Posts")


const posts = express.Router({mergeParams: true})

posts.get("/", async (req , res) => {

const {username} = req.params

try{
    const allPosts = await getAllPosts(username)
    res.json(allPosts)
}
catch(error){
    res.json(error)
}

})

posts.post("/", async (req , res) => {
    try{
        const post = await createPost(req.body)
        res.json(post)
    }
    catch(error){
        res.status(400).json({ error: error });
    }
})


posts.delete("/:id", async (req , res) => {
    const {id} = req.params
    const deletePost = await deletePosts(id)
    if(deletePost.id){
        res.status(200).json(deletePost)
    }
    else{
        res.status(404).json("Post not found")
    }
})


posts.put("/:id", async (req , res) => {
    const {id} = req.params;

    const updatedPost = await updatePost(id, req.body);

    res.status(200).json(updatedPost);
})

module.exports = posts