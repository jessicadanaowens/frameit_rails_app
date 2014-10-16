var hangIt = function() {

  var img = new Image();
  img.crossOrigin = "Anonymous";
  img.onload = function(){
    ctx.drawImage(img, 0, 0);
    ctx.save();
    canvas.add(ctx.getImageData(0,0, canvas.width, canvas.height));
  };

  var background = new Image();
  background.crossOrigin = "Anonymous";
  background.onload = function(){
      console.log("about to paint canvas");
      ctx.drawImage(background, 0, 0);
      ctx.save();
      canvas.add(ctx.getImageData(0,0, canvas.width, canvas.height));
    };


    background.src = $('#background-wall').attr('src');
    img.src = $('#hang-picture').attr('src');

    var canvas=document.getElementById("canvas");
    var ctx=canvas.getContext("2d");
    var canvasOffset=$("#canvas").offset();
    var offsetX=canvasOffset.left;
    var offsetY=canvasOffset.top;
    var canvasWidth=canvas.width;
    var canvasHeight=canvas.height;
    var isDragging=false;

    ctx.clearRect ( 0 , 0 , canvas.width , canvas.height );

    function handleMouseDown(e){
      canMouseX=parseInt(e.clientX-offsetX);
      canMouseY=parseInt(e.clientY-offsetY);
      // set the drag flag
      isDragging=true;
    }

    function handleMouseUp(e){
      canMouseX=parseInt(e.clientX-offsetX);
      canMouseY=parseInt(e.clientY-offsetY);
      // clear the drag flag
      isDragging=false;
    }

    function handleMouseOut(e){
      canMouseX=parseInt(e.clientX-offsetX);
      canMouseY=parseInt(e.clientY-offsetY);
      // user has left the canvas, so clear the drag flag
      //isDragging=false;
    }

    function handleMouseMove(e){
      canMouseX=parseInt(e.clientX-offsetX);
      canMouseY=parseInt(e.clientY-offsetY);
      // if the drag flag is set, clear the canvas and draw the image
      if(isDragging){
        ctx.clearRect(0,0,canvasWidth,canvasHeight);
        ctx.drawImage(background, 0, 0, canvas.width, canvas.height);
        ctx.drawImage(img,canMouseX-128/2,canMouseY-120/2,128,120);
      }
    }

    $("#canvas").mousedown(function(e){handleMouseDown(e);});
    $("#canvas").mousemove(function(e){handleMouseMove(e);});
    $("#canvas").mouseup(function(e){handleMouseUp(e);});
    $("#canvas").mouseout(function(e){handleMouseOut(e);});

    $('#save-wall').on('click', function () {
      var dataURL = canvas.toDataURL();
      debugger;
      $.ajax({
        type: "POST",
        url: "/arrangements",
        dataType: "json",
        data: {url: dataURL},
        success: function() {
          console.log("success");
        }
      });
    });
};

//image slider doesn't work with