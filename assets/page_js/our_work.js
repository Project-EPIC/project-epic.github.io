$(document).ready(function(){

	$('.sections[data-type="background"]').each(function(){
		var $bgobj = $(this); // assigning the object

		$(window).scroll(function(){
			var yPos = -($(window).scrollTop() / $bgobj.data('speed'));

			// Put together our final background position
			var coords = '50% '+ yPos + 'px';

			// Move the background
			$bgobj.css({ backgroundPosition: coords });
		});
    });

	function scrollToAnchor(aid){
	    var aTag = $("a[name='"+ aid +"']");
	    $('html,body').animate({scrollTop: aTag.offset().top}, 'slow');
	}

});

// 	//We will use this later.
// 	var formatTime = d3.time.format("%e %B");
//     var popup = d3.select("body").append("div")
//     	.attr("class", "tooltip")
//     	.style("opacity", 0);

// 	var color = d3.scale.category10();
// 	var width = $("#vis").parent().width();
// 	var height = 400;
// 	var force = d3.layout.force()
// 		.charge(-520)
// 		.linkDistance(100)
// 		.size([width, height]);

// 	var svg = d3.select("#vis")
// 		.attr("width", width)
// 		.attr("height", height);

// 	d3.json("/assets/data/data.json", function(error, graph){
// 		force.nodes(graph.nodes)
// 			.links(graph.links)
// 			.start();

// 		var link = svg.selectAll(".link")
// 			.data(graph.links)
// 			.enter().append("line")
// 			.attr("class", "link")
// 			.style("stroke-width", function(d) {
// 				return Math.sqrt(d.value);
// 			});

// 		var node = svg.selectAll(".node")
// 			.data(graph.nodes)
// 			.enter().append("circle")
// 			.attr("class", "node")
// 			.attr("cursor", "pointer")
// 			.attr("r", 20)
// 			.style("fill", function(d) {
// 				switch(d.group){
// 					case 1: return "Green";
// 					case 2: return "Blue";
// 					case 3: return "Orange";
// 				}
// 			})
// 			.on ("click", function(d){
// 				scrollToAnchor(d.section);
// 			})
// 			.on ("mouseover", function(d){
// 				popup.transition()
// 					.duration(200)
// 					.style("opacity", 0.9);

// 				popup.html(d.name)
// 					.style("left", (d3.event.pageX) + "px")
// 					.style("top", (d3.event.pageY - 28) + "px");
// 			})
// 			.on ('mouseout', function(d){
// 				popup.transition()
// 					.duration(500)
// 					.style("opacity", 0);
// 			});

// 		node.append("title").text(function(d) { return d.name; });

// 		force.on("tick", function(){
// 			link.attr("x1", function(d) { return d.source.x; })
// 				.attr("y1", function(d) { return d.source.y; })
// 				.attr("x2", function(d) { return d.target.x; })
// 				.attr("y2", function(d) { return d.target.y; });

// 			node.attr("cx", function(d) { return d.x; })
// 				.attr("cy", function(d) { return d.y; });

// 		});
// 	});
// });
