////
////  HabitRowView.swift
////  Habits Home
////
////  Created by Ayush Singh on 16/09/25.
////
//
//import SwiftUI
//import Combine
//import RealmSwift
//
//struct HabitRowView : View {
//    
//
//    @State var isChangingHabit: Bool = false
//    @State var isEditingHabit: Bool = false
//    
//    @State var habitName = ""
//    
//    @ObservedRealmObject var habit : Habit
//    
//    var store : HabitStore
//    
//    
//    var body: some View {
//        HStack {
//            Image(systemName: habit.isCompleted ? "checkmark.circle.fill" : "circle")
//                .font(.title)
//                .foregroundColor(habit.isCompleted ? .green : .gray)
//                .onTapGesture {
//                    try? habit.realm?.write {
//                                            habit.isCompleted.toggle()
//                                        }
//                }
//            
//            Text(habit.name)
//                .font(.headline)
//                .foregroundColor(.primary)
//            
//            Spacer()
//            
//            Button(action: {
//                store.toggleCompletion(habit: habit)
//            }) {
//                Text(habit.isCompleted ? "Done" : "Mark Done")
//                    .font(.subheadline)
//                    .padding(.horizontal, 12)
//                    .padding(.vertical, 6)
//                    .background(habit.isCompleted ? Color.green.opacity(0.2) : Color.blue.opacity(0.2))
//                    .foregroundColor(habit.isCompleted ? .green : .blue)
//                    .cornerRadius(8)
//            }
//            
//            Button(action:{
//                isChangingHabit=true
//            }){
//                Image(systemName: "ellipsis")
//            }.alert("Select Action" ,isPresented: $isChangingHabit) {
//                
//                Button("Edit") {
//                    
//                        habitName=habit.name
//                        isEditingHabit=true
//                
//                }
//                
//                Button("Delete", role: .destructive){
//                    store.deleteHabit(habit: habit)
//                }
//                
//            }.alert("Edit Habbit", isPresented: $isEditingHabit) {
//                
//                let oldName=habit.name
//                
//                TextField("Enter new name", text: $habitName)
//                Button("Save") {
//                    store.editHabit(habit: habit, newName: habitName)
//                    
//                    isEditingHabit = false
//                }
//                Button("Cancel", role: .cancel){
//                    habit.name=oldName
//                }
//            }
//
//        }
//        .padding()
//        .background(Color(.white))
//        .cornerRadius(12)
//        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 3)
//    }
//}
//


////
////  HabitRowView.swift
////  Habits Home
////
////  Created by Ayush Singh on 16/09/25.
////

////
////  HabitRowView.swift
////  Habits Home
////
////  Created by Ayush Singh on 16/09/25.
////

////
////  HabitRowView.swift
////  Habits Home
////
////  Created by Ayush Singh on 16/09/25.
////

////
////  HabitRowView.swift
////  Habits Home
////
////  Created by Ayush Singh on 16/09/25.
////

//
//  HabitRowView.swift
//  Habits Home
//
//  Created by Ayush Singh on 16/09/25.
//

import SwiftUI
import RealmSwift

struct HabitRowView: View {
    
    @ObservedRealmObject var habit: Habit
    @State private var isChangingHabit = false
    @State private var isEditingHabit = false
    @State private var habitName = ""
    
    var body: some View {
        HStack {
            // Toggle completion
            Image(systemName: habit.isCompleted ? "checkmark.circle.fill" : "circle")
                .font(.title)
                .foregroundColor(habit.isCompleted ? .green : .gray)
                .onTapGesture {
                    $habit.isCompleted.wrappedValue.toggle()
                }
            
            // Habit Name
            Text(habit.name)
                .font(.headline)
            
            Spacer()
            
            // Toggle button
            Button {
                $habit.isCompleted.wrappedValue.toggle()
            } label: {
                Text(habit.isCompleted ? "Done" : "Mark Done")
                    .font(.subheadline)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(habit.isCompleted ? Color.green.opacity(0.2) : Color.blue.opacity(0.2))
                    .foregroundColor(habit.isCompleted ? .green : .blue)
                    .cornerRadius(8)
            }
            
            // Edit/Delete menu
            Button { isChangingHabit = true } label: {
                Image(systemName: "ellipsis")
            }
            .alert("Select Action", isPresented: $isChangingHabit) {
                Button("Edit") {
                    habitName = habit.name
                    isEditingHabit = true
                }
                Button("Delete", role: .destructive) {
                    // --- START: CORRECTED CODE ---
                    // 1. Thaw the frozen habit to get a live, mutable version.
                    if let thawedHabit = habit.thaw(),
                       // 2. Get the live Realm instance from the thawed object.
                       let realm = thawedHabit.realm {
                        // 3. Perform the write transaction on the live Realm.
                        try? realm.write {
                            realm.delete(thawedHabit)
                        }
                    }
                    // --- END: CORRECTED CODE ---
                }
            }
            .alert("Edit Habit", isPresented: $isEditingHabit) {
                TextField("Enter new name", text: $habitName)
                Button("Save") {
                    $habit.name.wrappedValue = habitName
                    isEditingHabit = false
                }
                Button("Cancel", role: .cancel) {}
            }
        }
        .padding()
        .background(Color(.white))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 3)
    }
}
