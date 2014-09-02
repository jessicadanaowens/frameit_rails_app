describe("forms", function () {
  it("should show the upload-picture-form when the picture-form-button is clicked", function () {
    var testHtml = '<div id="picture-form-button"></div><form id="#upload-picture-form"></form>';
    // setup the dom to include your test html

//    var element = document.createElement('<div id="picture-form-button"></div>');

    // assert that '#upload-picture-form' is not visible
    document.click('#picture-form-button');

    // assert that '#upload-picture-form' is visible
    expect(element).toEqual('');
  });
});
