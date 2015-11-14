//= require bootstrap-datepicker
//= require admin/dropzone

// Dropzone
Dropzone.options.galleryUpload = {
  paramName: "admin_gallery[image]",
  maxFilesize: 0.6,
  maxFile: 1,
  init: function() {
    thisDropzone = this;
    this.on("success", function(file, responseText) {
      eval(responseText);
      thisDropzone.removeAllFiles();
    });
  }
}

