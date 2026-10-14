
import SwiftUI

struct TaskDetailView: View {

    let task: TaskItem

    var body: some View {

        ScrollView {

            VStack(spacing: 10) {

                // Task status icon

                Image(
                    systemName: task.completed
                        ? "checkmark.circle.fill"
                        : "circle"
                )
                .font(.largeTitle)
                .foregroundStyle(
                    task.completed ? Color.green : Color.gray
                )

                // Task title

                Text(task.title)
                    .font(.headline)
                    .multilineTextAlignment(.center)

                // Task status

                Text(
                    task.completed
                        ? "Completed"
                        : "Pending"
                )
                .font(.caption)
                .foregroundStyle(
                    task.completed ? Color.green : Color.orange
                )

            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 12)

        }
        .navigationTitle("Task Details")
    }
}

#Preview {
    NavigationStack {

        TaskDetailView(
            task: TaskItem(
                title: "Morning Walk",
                completed: true
            )
        )

    }
}
