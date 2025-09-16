

import SwiftUI
import RealmSwift

class Habit: Object, Identifiable{
    
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var name: String = ""
    @Persisted var isCompleted: Bool = false
    
    convenience init(name: String, isCompleted: Bool = false) {
        self.init()
        self.name = name
        self.isCompleted = isCompleted
    }
}


struct HabitView: View {
    
    @ObservedResults(Habit.self) var habits
    @State var isAddingHabit: Bool = false
    @State var habitName = ""
    var streak: Int = 0
    
    var progress: Double {
        let completed = habits.filter { $0.isCompleted }.count
        return habits.isEmpty ? 0 : Double(completed) / Double(habits.count)
    }
    
    var body: some View {
        
        VStack(spacing: 30) {
            
            HStack{
                Text("Today's Habits")
                Spacer()
                Button(action:{
                    isAddingHabit=true
                    
                }){
                    Image(systemName: "plus.circle.fill")
                }.foregroundStyle(.green)
                .alert("Add Habit", isPresented: $isAddingHabit) {
                    TextField("Enter Habit", text: $habitName).font(.body)
                    
                    Button("Cancel", role: .cancel) {
                        isAddingHabit = false
                    }
                    
                    Button("Add") {
                        let trimmedString = habitName.trimmingCharacters(in: .whitespacesAndNewlines)
                        
                        if !trimmedString.isEmpty {
                            let newHabit = Habit(name: trimmedString)
                            $habits.append(newHabit)
                            habitName=""
                        }
                    }
                    
                } message: {
                    Text("Add a new habit to your list.")
                }
            }
            .font(.largeTitle)
            .fontWeight(.bold)
            .padding(.horizontal, 20)
            
            
 
            ZStack{
                Color(.systemGroupedBackground)
                if habits.isEmpty {
                    VStack {
                        Spacer()
                        Text("No habits yet!")
                            .font(.headline)
                            .foregroundColor(.gray)
                        Text("Tap + to add a habit")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        Spacer()
                    }
                }else{
                    VStack(spacing: 20) {
                        
               
                        VStack(alignment: .leading) {
                            HStack{
                                Text("Progress: \(Int(progress * 100))%")
                                
                                Spacer()
                                Text("Streak: \(streak)")
                            }.font(.headline)
                            
                            ProgressView(value: progress)
                                .progressViewStyle(LinearProgressViewStyle(tint: .green))
                                .frame(height: 8)
                                .cornerRadius(10)
                        }
                        .padding(.horizontal)
                        
                        ScrollView{
                            ForEach(habits) { habit in
                                HabitRowView(habit: habit)
                                    .padding(.horizontal)
                            }
                            Spacer()
                        }
                    }
                    .padding(.top,10)
                }
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    HabitView()
}
