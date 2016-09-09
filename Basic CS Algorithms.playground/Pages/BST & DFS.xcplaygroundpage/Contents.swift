//: Playground - noun: a place where people can play

import UIKit

var str = "BST Insertion"


/*
 BST is a search tree built such that every child node to the left is smaller than or equal to the parent, and every node to the right is greater than the parent
 */

let sample: [Int] = [9, 5, 10, 6, 1, 1024, 67, 98, 93]

/* 
 CANNOT use a struct here since the left and right pointers reference an object of type Node.
 struct is a value type and such referencing is not allowed, hence the need to use a class / object instance
 */


// Create a Node class that represents a node in the BST
class Node <T: Comparable> {
    var value: T
    var left: Node? = nil
    var right: Node? = nil
    
    init(value: T) {
        self.value = value
    }
}

// This enum cannot be nested within the generic struct
enum Traversal {
    case Inorder, Preorder, Postorder
}


struct BST<T: Comparable> {
    private var root: Node<T>? = nil
    var isEmpty: Bool {
        if let list = elements {
            return list.isEmpty
        } else {
            return true
        }
    }
    var elements:[T]? = nil { didSet { process() } }
    
    private mutating func process() {
        guard let elements = elements else { return }
        for element in elements {
            insert(value: element)
        }
    }
    
    
    private mutating func insert(value: T) {
        if root == nil {
            root = Node(value: value)
            return
        }
        var current = root
        var parent: Node<T>?
        while current != nil {
            parent = current
            if let nodevalue = current?.value  {
                if nodevalue > value {
                    current = current?.left
                } else {
                    current = current?.right
                }
            } else {
                current = nil
            }
        }
        
        if let parent = parent {
            if parent.value > value {
                value
                parent.left = Node(value: value)
            } else {
                value
                parent.right = Node(value: value)
            }
        }
    }
    
    
    // MARK: Depth First Traversal logic
    private func traverse(_ traversal: Traversal, _ node: Node<T>?)  {
        guard node != nil else {return}
        switch traversal {
        case .Inorder:
            print(node?.value)
            traverse(traversal, node?.left)
            traverse(traversal, node?.right)
        case .Preorder:
            traverse(traversal, node?.left)
            node?.value
            traverse(traversal, node?.right)
        case .Postorder:
            traverse(traversal, node?.right)
            node?.value
            traverse(traversal, node?.left)
        }
    }
    
    // wrapper function that triggers dfs
    func dfs(_ traversal: Traversal) {
        traverse(traversal, root)
    }
}

var bst = BST<Int>()
bst.elements = sample
bst.dfs(.Inorder)
bst.dfs(.Preorder)
bst.dfs(.Postorder)









