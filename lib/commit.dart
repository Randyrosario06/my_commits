class CommitObject {
  String? sha;
  String? nodeId;
  Commit? commit;
  String? url;
  String? htmlUrl;
  String? commentsUrl;
  Author? author;
  Author? committer;
  List<Parents>? parents;

  CommitObject(
      {this.sha,
      this.nodeId,
      this.commit,
      this.url,
      this.htmlUrl,
      this.commentsUrl,
      this.author,
      this.committer,
      this.parents});

  CommitObject.fromJson(Map<String, dynamic> json) {
    sha = json['sha'];
    nodeId = json['node_id'];
    commit = json['commit'] != null ? Commit.fromJson(json['commit']) : null;
    url = json['url'];
    htmlUrl = json['html_url'];
    commentsUrl = json['comments_url'];
    author = json['author'] != null ? Author.fromJson(json['author']) : null;
    committer =
        json['committer'] != null ? Author.fromJson(json['committer']) : null;
    if (json['parents'] != null) {
      parents = <Parents>[];
      json['parents'].forEach((v) {
        parents!.add(Parents.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['sha'] = sha;
    data['node_id'] = nodeId;
    if (commit != null) {
      data['commit'] = commit!.toJson();
    }
    data['url'] = url;
    data['html_url'] = htmlUrl;
    data['comments_url'] = commentsUrl;
    if (author != null) {
      data['author'] = author!.toJson();
    }
    if (committer != null) {
      data['committer'] = committer!.toJson();
    }
    if (parents != null) {
      data['parents'] = parents!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Commit {
  CommitAuthor? author;
  CommitAuthor? committer;
  String? message;
  Tree? tree;
  String? url;
  int? commentCount;
  Verification? verification;

  Commit(
      {this.author,
      this.committer,
      this.message,
      this.tree,
      this.url,
      this.commentCount,
      this.verification});

  Commit.fromJson(Map<String, dynamic> json) {
    author =
        json['author'] != null ? CommitAuthor.fromJson(json['author']) : null;
    committer = json['committer'] != null
        ? CommitAuthor.fromJson(json['committer'])
        : null;
    message = json['message'];
    tree = json['tree'] != null ? Tree.fromJson(json['tree']) : null;
    url = json['url'];
    commentCount = json['comment_count'];
    verification = json['verification'] != null
        ? Verification.fromJson(json['verification'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (author != null) {
      data['author'] = this.author!.toJson();
    }
    if (committer != null) {
      data['committer'] = committer!.toJson();
    }
    data['message'] = message;
    if (tree != null) {
      data['tree'] = tree!.toJson();
    }
    data['url'] = url;
    data['comment_count'] = commentCount;
    if (verification != null) {
      data['verification'] = verification!.toJson();
    }
    return data;
  }
}

class CommitAuthor {
  String? name;
  String? email;
  String? date;

  CommitAuthor({this.name, this.email, this.date});

  CommitAuthor.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['email'] = email;
    data['date'] = date;
    return data;
  }
}

class Tree {
  String? sha;
  String? url;

  Tree({this.sha, this.url});

  Tree.fromJson(Map<String, dynamic> json) {
    sha = json['sha'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['sha'] = sha;
    data['url'] = url;
    return data;
  }
}

class Verification {
  bool? verified;
  String? reason;
  Null? signature;
  Null? payload;

  Verification({this.verified, this.reason, this.signature, this.payload});

  Verification.fromJson(Map<String, dynamic> json) {
    verified = json['verified'];
    reason = json['reason'];
    signature = json['signature'];
    payload = json['payload'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['verified'] = verified;
    data['reason'] = reason;
    data['signature'] = signature;
    data['payload'] = payload;
    return data;
  }
}

class Author {
  String? login;
  int? id;
  String? nodeId;
  String? avatarUrl;
  String? gravatarId;
  String? url;
  String? htmlUrl;
  String? followersUrl;
  String? followingUrl;
  String? gistsUrl;
  String? starredUrl;
  String? subscriptionsUrl;
  String? organizationsUrl;
  String? reposUrl;
  String? eventsUrl;
  String? receivedEventsUrl;
  String? type;
  bool? siteAdmin;

  Author(
      {this.login,
      this.id,
      this.nodeId,
      this.avatarUrl,
      this.gravatarId,
      this.url,
      this.htmlUrl,
      this.followersUrl,
      this.followingUrl,
      this.gistsUrl,
      this.starredUrl,
      this.subscriptionsUrl,
      this.organizationsUrl,
      this.reposUrl,
      this.eventsUrl,
      this.receivedEventsUrl,
      this.type,
      this.siteAdmin});

  Author.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    id = json['id'];
    nodeId = json['node_id'];
    avatarUrl = json['avatar_url'];
    gravatarId = json['gravatar_id'];
    url = json['url'];
    htmlUrl = json['html_url'];
    followersUrl = json['followers_url'];
    followingUrl = json['following_url'];
    gistsUrl = json['gists_url'];
    starredUrl = json['starred_url'];
    subscriptionsUrl = json['subscriptions_url'];
    organizationsUrl = json['organizations_url'];
    reposUrl = json['repos_url'];
    eventsUrl = json['events_url'];
    receivedEventsUrl = json['received_events_url'];
    type = json['type'];
    siteAdmin = json['site_admin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['login'] = login;
    data['id'] = id;
    data['node_id'] = nodeId;
    data['avatar_url'] = avatarUrl;
    data['gravatar_id'] = gravatarId;
    data['url'] = url;
    data['html_url'] = htmlUrl;
    data['followers_url'] = followersUrl;
    data['following_url'] = followingUrl;
    data['gists_url'] = gistsUrl;
    data['starred_url'] = starredUrl;
    data['subscriptions_url'] = subscriptionsUrl;
    data['organizations_url'] = organizationsUrl;
    data['repos_url'] = reposUrl;
    data['events_url'] = eventsUrl;
    data['received_events_url'] = receivedEventsUrl;
    data['type'] = type;
    data['site_admin'] = siteAdmin;
    return data;
  }
}

class Parents {
  String? sha;
  String? url;
  String? htmlUrl;

  Parents({this.sha, this.url, this.htmlUrl});

  Parents.fromJson(Map<String, dynamic> json) {
    sha = json['sha'];
    url = json['url'];
    htmlUrl = json['html_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['sha'] = sha;
    data['url'] = url;
    data['html_url'] = htmlUrl;
    return data;
  }
}
