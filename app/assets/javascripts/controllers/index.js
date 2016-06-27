var normalizedPath = require("path").join(__dirname, "controllers");

require("fs").readdirSync(normalizedPath).forEach(function(file) {
  require("./controllers/" + file);
});
