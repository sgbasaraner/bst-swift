//
//  main.swift
//  swiftBST
//
//  Created by Sarp Guney on 15.02.2018.
//  Copyright © 2018 Sarp Guney. All rights reserved.
//

import Foundation

class Node<T: Comparable> {
	let data: T
	var left: Node?
	var right: Node?
	
	init(data: T) {
		self.data = data
		self.left = nil
		self.right = nil
	}
}

func insert<T>(node: inout Node<T>?, data: T) {
	if node == nil {
		node = Node(data: data)
	} else if data <= node!.data {
		insert(node: &node!.left, data: data)
	} else {
		insert(node: &node!.right, data: data)
	}
}

func buildTree<T>(root: inout Node<T>?, arr: [T]) {
	for char in arr {
		insert(node: &root, data: char)
	}
}

func inOrderTraversal<T>(root: Node<T>?) {
	if root == nil { return }
	inOrderTraversal(root: root!.left)
	print(root!.data, separator: "", terminator: " ")
	inOrderTraversal(root: root!.right)
}

func preOrderTraversal<T>(root: Node<T>?) {
	if root == nil { return }
	print(root!.data, separator: "", terminator: " ")
	preOrderTraversal(root: root!.left)
	preOrderTraversal(root: root!.right)
}

func postOrderTraversal<T>(root: Node<T>?) {
	if root == nil { return }
	postOrderTraversal(root: root!.left)
	postOrderTraversal(root: root!.right)
	print(root!.data, separator: "", terminator: " ")
}

func levelOrderTraversal<T>(root: Node<T>?) {
	var queue = [Node<T>]()
	if root != nil {
		queue.append(root!)
	}
	while !queue.isEmpty {
		let front = queue.first!
		print(front.data, separator: "", terminator: " ")
		if front.left != nil {
			queue.append(front.left!)
		}
		if front.right != nil {
			queue.append(front.right!)
		}
		queue.remove(at: 0)
	}
	
}

var root: Node<Character>? = nil
buildTree(root: &root, arr: ["F", "D", "J", "B", "E", "G", "K", "A", "C", "I", "H"])
inOrderTraversal(root: root)
print("")
preOrderTraversal(root: root)
print("")
postOrderTraversal(root: root)
print("")
levelOrderTraversal(root: root)
print("")

