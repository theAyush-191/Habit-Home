////
////  HabitRowView.swift
////  Habits Home
////
////  Created by Ayush Singh on 16/09/25.
////

import SwiftUI

struct HabitRowView: View {
    
    @Environment(\.modelContext) private var Context
    
    @Bindable var habit:Habit
    
    @State private var isChangingHabit = false
    @State private var isEditingHabit = false
    @State private var habitName = ""
    
    var body: some View {
        HStack {
     
            Image(systemName: habit.isCompleted ? "checkmark.circle.fill" : "circle")
                .font(.title)
                .foregroundColor(habit.isCompleted ? .green : .gray)
                .onTapGesture {
                    habit.isCompleted = !habit.isCompleted
                }
            
        
            Text(habit.habit)
                .font(.headline)
            
            Spacer()
            

            Button {
                habit.isCompleted = !habit.isCompleted
            } label: {
                Text(habit.isCompleted ? "Done" : "Mark Done")
                    .font(.subheadline)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(habit.isCompleted ? Color.green.opacity(0.2) : Color.blue.opacity(0.2))
                    .foregroundColor(habit.isCompleted ? .green : .blue)
                    .cornerRadius(8)
            }
            
  
            Button { isChangingHabit = true } label: {
                Image(systemName: "ellipsis")
            }
            .alert("Select Action", isPresented: $isChangingHabit) {
                Button("Edit") {
                    habitName = habit.habit
                    isEditingHabit = true
                }
                Button("Delete", role: .destructive) {
                    
                    Context.delete(habit)
                
                }
            }
            .alert("Edit Habit", isPresented: $isEditingHabit) {
                TextField("Enter new name", text: $habitName)
                Button("Save") {
                    habit.habit = habitName
                    habit.createdAt=Date()
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
