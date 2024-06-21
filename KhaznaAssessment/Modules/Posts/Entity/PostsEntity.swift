//
//  PostEntity.swift
//  KhaznaAssessment
//
//  Created by Sharaf on 6/20/24.
//

import Foundation
import RealmSwift

// MARK: - Post
struct Post: Entity {
    typealias RealmEntityType = PostRealm
    
    let id: Int
    let title: String
    let body: String
    var isFavorited: Bool = false
    var realmObject: PostRealm {
        return PostRealm(entity: self)
    }
}

extension Post {
    
    init(model: PostResponse) {
        self.init(
            id: model.id ?? 0,
            title: model.title ?? "",
            body: model.body ?? ""
        )
    }
    
    init(entity: RealmEntityType) {
        self.id = entity.id
        self.title = entity.title
        self.body = entity.body
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

