function getIcon(tag){
    return "<a target='_self' href='/projects/"+tag+"' class='circular  project-"+tag+"'></a>";
}

function add(tag, year, type, title, desc, tech ){

   var icon = getIcon(tag);

    addProject(icon, year, type, title, desc, tech );
    addProjectByYear(icon, year );
    addProjectByCategory(icon, type );
}
function addProject(icon, year, type, title, desc, tech ){

    var project =
    "<tr><td class='iconCell'> "+icon+"</td>"+
        "<td class='year'>"+year+"</td>"+
        "<td class='type "+type+"'>"+type+"</td>"+
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
function addProjectByCategory(icon, type){
    if ($("#projectStatus").find("."+type).length == 0 )
        $("#projectStatus").append("<div class='category "+type+"' >"+
            "<p >"+type+"</p></div>");

    $("#projectStatus").find("."+type).append(icon);

}
