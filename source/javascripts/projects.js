//if you add a new status , add a color in projects.css with the correct name
var progress = "In progress",
    released = "Released",
    deprecated = "Deprecated";

function getIcon(tag){
    return "<a target='_self' href='/projects/"+tag+"' class='circular  project-"+tag+"'></a>";
}

function getStatusTag(status){
    return status.toLowerCase().replace(/\s/g,"-");
}
function add(tag, year, status, title, desc, tech ){
    
   var icon = getIcon(tag);
   
    addProject(icon, year, status, title, desc, tech );
    addProjectByYear(icon, year );
    addProjectByStatus(icon, status );
}
function addProject(icon, year, status, title, desc, tech ){
    
    var project = 
    "<tr><td class='iconCell'> "+icon+"</td>"+
        "<td class='year'>"+year+"</td>"+
        "<td class='status "+getStatusTag(status)+"'>"+status+"</td>"+
        "<td class='description'>"+
            "<p class='title'>"+title+"</p>"+
            "<p>"+desc+"</p>"+
            "<p class='gray'>"+tech+"</p>"+
        "</td>"+
     "</tr>";
     $("#projects").append(project);
}

function addProjectByYear(icon, year){
    if ($("#projectYear").find("."+year).length == 0 ) 
        $("#projectYear").append("<div class='category "+year+"' >"+
            "<p class='gray'>"+year+"</p></div>");
    
    $("#projectYear").find("."+year).append(icon);
    
}
function addProjectByStatus(icon, status){
    var className = getStatusTag(status);
    if ($("#projectStatus").find("."+className).length == 0 ) 
        $("#projectStatus").append("<div class='category "+className+"' >"+
            "<p >"+status+"</p></div>");
    
    $("#projectStatus").find("."+className).append(icon);
    
}

