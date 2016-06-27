var Poller = function(channel) {
  this.updater = this.update(channel);
};

Poller.prototype.update = function(channel) {
  $.getScript(channel)
  setTimeout(this.update(channel), 10000);
}
