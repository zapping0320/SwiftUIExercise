//
//  ContentView.swift
//  SwiftUIExercise
//
//  Created by DD Dev on 2020/11/17.
//

import SwiftUI

struct ContentView: View {
    
    @State var name = ""
    @State var age = ""
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("이름을 입력해주세요", text: $name)
                        .keyboardType(.default) //키보드를 기본 키보드로 보여줍니다.
                }
                Section{
                    TextField("나이를 입력해주세요", text: $age)
                        .keyboardType(.numberPad) // number형식의 키보드를 보여줍니다.
                    
                }
                Section{
                    Text("\(name)님의 나이는 \(age)살입니다. ")
                }
            }.navigationBarTitle("회원가입")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
