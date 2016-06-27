var Conversation = function(params) {
  params = params || {};
  this.group = params.group;
  this.messages = params.messages || [];
}
