var Message = function(params) {
  params = params || {};
  this.content = params.content || "";
  this.conversation = params.conversation;
  this.sender = params.sender;
  this.receiver = params.receiver;
}
