//
//  ContentView.swift
//  SwiftUIExercise
//
//  Created by DD Dev on 2020/11/17.
//

import SwiftUI

struct ContentView: View {
    let genderType = ["남성","여성","비밀"]
    
    @State var name = ""
    @State var age = ""
    @State var bornIn = 0
    @State var gender = 0
    
    @State var isPresent: Bool = false
    
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
                Section(header: Text("생년월일")){
                    //선택하는 값을 bornIn 변수에 할당합니다.
                    Picker("출생년도",selection: $bornIn){
                        // 1900부터 2018까지 Text를 만듭니다.
                        ForEach(1900 ..< 2019 ){
                            Text("\(String($0))년생")
                        }
                    }
                }
                Section(header: Text("성별")){
                    //선택하는 값을 bornIn 변수에 할당합니다.
                    Picker("성별",selection: $gender){
                        // 1900부터 2018까지 Text를 만듭니다.
                        ForEach( 0  ..< genderType.count ){
                            Text("\(self.genderType[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("결과")){
                    Text("\(resultScript)")
                }
                Button(action:
                        {
                            self.isPresent = true
                            print("\(resultScript) - 회원 가입 처리합니다")
                        }
                       , label: {
                        Text("가입하기")
                       }).alert(isPresented: $isPresent, content: {
                        Alert(title: Text("회원가입"), message: Text("처리 하였습니다!"), dismissButton: .default(Text("OK")))
                        
                       })
                
                
            }.navigationBarTitle("회원가입")
        }
    }
    
    var resultScript:String{
      if(name.isEmpty){
        return "이름을 입력해주세요."
      }else{
        return "\(name)님은 성별이 \(genderType[gender])이며 나이는 \(120 - bornIn)입니다."
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
