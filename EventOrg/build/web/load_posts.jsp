<%@page import="com.tech.blog.entities.Post" %>
<%@page import="com.tech.blog.entities.User" %>
<%@page import="com.tech.blog.dao.PostDao" %>
<%@page import="com.tech.blog.dao.LikeDao" %>
<%@page import="java.util.List" %>
<%@page import="com.tech.blog.helper.ConnectionProvider" %>

<div class="row">
<% 
    //Thread.sleep(1000);
    
    PostDao d=new PostDao(ConnectionProvider.getConnection());
    List<Post> posts=null;
    int cid=Integer.parseInt(request.getParameter("cid"));
    
    if(cid==0){
        posts=d.getAllPosts();
    }
    else{
        posts=d.getPostByCatId(cid);
    }
    
    if(posts.size()==0){
        out.println("<h3 class='display-3 text-center'>No post in This Category</h3>");
        return;
    }
    
    for(Post p:posts)
    {
%>
    
<div class="col-md-6 mt-2">
    <div class="card">
        <img src="blog_pic/<%= p.getpPic() %>" class="card-img-top" style="max-height: 150px">
        <div class="card-body">
            <b><%= p.getpTitle() %></b>
            <p><%= p.getpContent() %></p>
            <pre><%= p.getpCode() %></pre>
        </div>
        
        <div class="card-footer  text-center">
            
            <% 
            LikeDao ld=new LikeDao(ConnectionProvider.getConnection());
            int count=ld.countLikeOnPost(p.getPid());
            User user=(User)session.getAttribute("currentuser");
            %>
                            
            <a href="#" onclick="doLike(<%= p.getPid() %>,<%= user.getId()%>)" class="btn btn-outline-primary btn-sm"><i class="fa fa-thumbs-up"></i><span class="like-counter" ><%=count %></span></a>
            <a href="show_blog_page.jsp?post_id=<%= p.getPid() %>" class="btn btn-outline-primary btn-sm">Read More...</a>
            <a href="#" class="btn btn-outline-primary btn-sm"><i class="fa fa-commenting-o"></i><span>20</span></a>
        </div>
        
    </div>
</div>

<% } %>

</div>