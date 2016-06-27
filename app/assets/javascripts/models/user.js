var User = function(params) {
  params = params || {};
  this.name = params.name || "Full Name";
  this.image = params.image || null;
  this.email = params.email || "Email Address";
  this.groups = params.groups || [];
  this.tasks = params.tasks || [];
  this.invites = params.invites || [];
  this.assignments = params.assignments || [];
  this.completions = params.completions || [];
  this.messages = params.messages || [];
  this.conversations = params.conversations || [];
}
