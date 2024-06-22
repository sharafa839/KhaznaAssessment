//
//  PostEntity.swift
//  KhaznaAssessment
//
//  Created by Sharaf on 6/20/24.
//

import Foundation
import RealmSwift

// MARK: - Post

// made the model is class not struct to be reference type so  when favorite post it will be still favorite when back to posts list

internal final class Post: Entity {
    typealias RealmEntityType = PostRealm
    
    let id: Int
    let title: String
    let body: String
    var isFavorited: Bool = false
    var realmObject: PostRealm {
        return PostRealm(entity: self)
    }
    
    init(id: Int, title: String, body: String, isFavorited: Bool) {
        self.id = id
        self.title = title
        self.body = body
        self.isFavorited = isFavorited
    }
}

extension Post {
    
    convenience init(model: PostResponse) {
        self.init(
            id: model.id ?? 0,
            title: model.title ?? "",
            body: model.body ?? "",
            isFavorited: false
        )
    }
    
    convenience init(entity: RealmEntityType) {
        self.init(id: entity.id, title: entity.title, body: entity.body, isFavorited: false)
    }
}

class PostRealm: Object, RealmEntity {
   
    typealias EntityType = Post
    
    @Persisted var title: String = ""
    @Persisted var body: String = ""
    @Persisted var id: Int = 0
    var entityObject: Post {
        return Post(entity: self)
    }
    
    convenience required init(entity: EntityType) {
        self.init()
        self.id = entity.id
        self.title = entity.title
        self.body = entity.body
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
}

