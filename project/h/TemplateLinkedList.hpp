//
// Created by os on 5/22/22.
//
#include "definefile.hpp"

template<typename T>class Node{
private:
    MEM_ALLOC;
    T data;
    Node<T>* next;
    template<typename U>friend class LinkedList;

public:
    Node(){
        this->next =nullptr;
    }
};

template<typename T>class LinkedList {
private:
    Node<T> *head;
    Node<T> *tail;

public:
    MEM_ALLOC;
    LinkedList() {
        this->head = nullptr;
        this->tail = nullptr;

    }

//    ~LinkedList(){
//        Node<T>* node =head;
//        while(node->next!= nullptr){
//            head=head->next;
//           delete  node;
//            node=head;
//        }
//        delete head;
//        head= nullptr;
//         tail= nullptr;
//    }
    void add(T item1) {
        Node <T> *node =  new Node<T>;
        node->data = item1;
        if (head == nullptr) {
            head = node;
            tail = node;
            return;
        }
        Node <T> *temp = tail;
        while (temp->next != nullptr) {
            temp = temp->next;
        }
        temp->next = node;
        tail = node;
    }

    int length() {
        int len = 0;
        Node <T> *temp = head;
        while (temp != nullptr) {
            len++;
            temp = temp->next;
        }
        return len;
    }


//    void remove() {
//        if (head == nullptr) {
//            return;
//        }
//        if (head->next == nullptr) {
//            delete head;
//            head = nullptr;
//            tail= nullptr;
//            return;
//        }
//
//        Node <T> *temp = head;
//        while (temp != nullptr) {
//            if (temp->next->next == nullptr) {
//                temp->next = nullptr;
//                break;
//            }
//            temp = temp->next;
//        }
//
//    }


    void removeFront() {
        if (head == nullptr) {
            return;
        }
        Node <T> *tmp = head;
        head = head->next;
        delete tmp;
        if(head== nullptr)tail= nullptr;
    }

    T get(int index) {
        if (head == nullptr) {
            return nullptr;
        }
        if (index >= length() || index < 0) {
            return nullptr;
        }
        if (index == 0) {
            return head->data;
        }
        int count = 0;
        T ret = nullptr;
        Node <T> *temp = head;
        while (temp != 0) {
            if (count++ == index) {
                ret = temp->data;
                break;
            }
            temp = temp->next;
        }
        return ret;
    }
};

