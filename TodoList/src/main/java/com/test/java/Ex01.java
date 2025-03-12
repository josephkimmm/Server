package com.test.java;

public class Ex01 {

    public static void main(String[] args) {
        
        Student s1 = new Student();//생성자가 명시적 하나만들어지면 기본생성자가 안만들어진다.
        
        s1.setName("홍길동");
        System.out.println(s1.getName());
        
        System.out.println(s1);
        
        Student s2 = new Student("아무개", 20, "남자");
        System.out.println(s2);
    }
}
