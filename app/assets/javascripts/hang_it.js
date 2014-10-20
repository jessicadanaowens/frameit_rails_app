var hangIt = function() {

  $('.hang-picture-container').hide();


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
    var hangPictureImg = new Kinetic.Image({


    image: imageObj,
    x: 0,
    y: 0,
    width: pictureWidth,
    height: pictureHeight,
    draggable: true
    });

    var createBackground = new Kinetic.Image({
      image: backgroundImage,
      x: 0,
      y: 0,
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

};

