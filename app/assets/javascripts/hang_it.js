var hangIt = function() {



  function drawImage(imageObj, backgroundImage) {

    var wallHeight = parseInt($('.wall-height').text());
    var pixelsPerInch = 400 / wallHeight;
    var pictureWidth = parseInt($('.picture-width').text()) * pixelsPerInch;
    var pictureHeight = parseInt($('.picture-height').text()) * pixelsPerInch;

    stage = new Kinetic.Stage({
    container: "container",
    width: 400,
    height: 400
    });
    var layer = new Kinetic.Layer();
    debugger;
    var hangPictureImg = new Kinetic.Image({


    image: imageObj,
    x: 100,
    y: 30,
    width: pictureWidth,
    height: pictureHeight,
    draggable: true
    });

    var createBackground = new Kinetic.Image({
      image: backgroundImage,
      x: 100,
      y: 30,
      draggable: false
    });

    // add cursor styling
    hangPictureImg.on('mouseover', function() {
    document.body.style.cursor = 'pointer';
    });
    hangPictureImg.on('mouseout', function() {
    document.body.style.cursor = 'default';
    });

    layer.add(createBackground);
    layer.add(hangPictureImg);
    stage.add(layer);


    document.getElementById('save-wall').addEventListener('click', function() {

      stage.toDataURL({
        callback: function(dataUrl) {
          $.ajax({
            type: "POST",
            url: "/arrangements",
            dataType: "json",
            data: {url: dataUrl},
            success: function() {
              console.log("success");
            }
          });
        }
      });
    }, false);


    }

    var backgroundImage = new Image();
    backgroundImage.crossOrigin = "Anonymous";

    var imageObj = new Image();
    imageObj.crossOrigin = "Anonymous";
    imageObj.onload = function() {
      drawImage(this, backgroundImage);
      };

    imageObj.src = $('#hang-picture').attr('src');
    backgroundImage.src = $('#background-wall').attr('src');



//  var img = new Image();
//  img.crossOrigin = "Anonymous";
//  img.onload = function(){
//    ctx.drawImage(img, 0, 0);
//    ctx.save();
//    canvas.add(ctx.getImageData(0,0, img.width, img.height));
//  };
//
//  var background = new Image();
//  background.crossOrigin = "Anonymous";
//  background.onload = function(){
//      console.log("about to paint canvas");
//      ctx.drawImage(background, 0, 0);
//      ctx.save();
//      canvas.add(ctx.getImageData(0,0, img.width, img.height));
//    };
//
//
//    background.src = $('#background-wall').attr('src');
//    img.src = $('#hang-picture').attr('src');
//
//    var canvas=document.getElementById("canvas");
//    var ctx=canvas.getContext("2d");
//    var canvasOffset=$("#canvas").offset();
//    var offsetX=canvasOffset.left;
//    var offsetY=canvasOffset.top;
//    var canvasWidth=canvas.width;
//    var canvasHeight=canvas.height;
//    var isDragging=false;
//
//    ctx.clearRect ( 0 , 0 , canvas.width , canvas.height );
//
//    function handleMouseDown(e){
//      canMouseX=parseInt(e.clientX-offsetX);
//      canMouseY=parseInt(e.clientY-offsetY);
//      // set the drag flag
//      isDragging=true;
//    }
//
//    function handleMouseUp(e){
//      canMouseX=parseInt(e.clientX-offsetX);
//      canMouseY=parseInt(e.clientY-offsetY);
//      // clear the drag flag
//      isDragging=false;
//    }
//
//    function handleMouseOut(e){
//      canMouseX=parseInt(e.clientX-offsetX);
//      canMouseY=parseInt(e.clientY-offsetY);
//      // user has left the canvas, so clear the drag flag
//      isDragging=false;
//    }
//
//    function handleMouseMove(e){
//      canMouseX=parseInt(e.clientX-offsetX);
//      canMouseY=parseInt(e.clientY-offsetY);
//      // if the drag flag is set, clear the canvas and draw the image
//      if(isDragging){
//        ctx.clearRect(0,0,canvasWidth,canvasHeight);
//        ctx.drawImage(background, 0, 0, canvas.width, canvas.height);
//        ctx.drawImage(img,canMouseX-128/2,canMouseY-120/2,128,120);
//      }
//    }
//
//    $("#canvas").mousedown(function(e){handleMouseDown(e);});
//    $("#canvas").mousemove(function(e){handleMouseMove(e);});
//    $("#canvas").mouseup(function(e){handleMouseUp(e);});
//    $("#canvas").mouseout(function(e){handleMouseOut(e);});

//
};

