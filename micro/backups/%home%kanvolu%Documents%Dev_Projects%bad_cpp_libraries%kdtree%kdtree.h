#pragma once

struct node{
	int left = -1;
	int right = -1;
	int depth;
	std::vector<int> values;

	node(std::vector<int> data, int d = 0);
	void print();
			
	auto begin() {return values.begin();}
	auto end() {return values.end();}
	
	auto begin() const {return values.begin();}
	auto end() const {return values.end();}
	
			// for making the [] notation work with the node
	int& operator[](size_t index) {return values[index];}
	const int& operator[](size_t index) const {return values[index];}
	
	size_t size() {return values.size();}
};
		
class kdtree{
	void next_node(std::vector<std::vector<int>> data, int depth = 0);
	long dist_sqrd(std::vector<int> target, std::vector<int> cur);
	node closest(std::vector<int> target, node temp, node cur);
public:
	std::vector<node> tree;
	kdtree(std::vector<std::vector<int>> data);
	node nearest(std::vector<int> target, int cur_pos = 0);
	void print(bool print_depth = false, int k = -1);

	auto begin() {return tree.begin();}
	auto end() {return tree.end();}

	auto begin() const {return tree.begin();}
	auto end() const {return tree.end();}
	// for making the [] notation work with the node
	node& operator[](size_t index) {return tree[index];}
	const node& operator[](size_t index) const {return tree[index];}

	size_t size() {return tree.size();}
};
