
import SwiftUI

struct ContentView: View {

    // MARK: - Initial Tasks

    @State private var tasks: [TaskItem] = [
        TaskItem(title: "Morning Walk", completed: true),
        TaskItem(title: "Drink Water", completed: false),
        TaskItem(title: "Read Notes", completed: false),
        TaskItem(title: "Call Home", completed: true)
    ]

    // MARK: - Completion Count

    private var completedCount: Int {
        tasks.filter { $0.completed }.count
    }

    // MARK: - Progress Percentage

    private var progressPercent: Int {
        guard !tasks.isEmpty else { return 0 }

        return Int(
            (Double(completedCount) /
             Double(tasks.count) * 100).rounded()
        )
    }

    // MARK: - Main Interface

    var body: some View {

        NavigationStack {

            List {

                // MARK: - Header and Progress

                VStack(alignment: .leading, spacing: 8) {

                    Text("Quick Tasks")
                        .font(.headline)
                        .fontWeight(.bold)

                    Text("\(completedCount) / \(tasks.count) Completed")
                        .font(.caption)
                        .foregroundStyle(.secondary)

                    ProgressView(
                        value: Double(completedCount),
                        total: Double(tasks.count)
                    )
                    .tint(.green)

                    Text("\(progressPercent)% Complete")
                        .font(.caption)
                        .foregroundStyle(.green)
                }
                .padding(.vertical, 6)
                .listRowBackground(Color.clear)

                // MARK: - Task Rows

                ForEach(tasks.indices, id: \.self) { index in

                    VStack(
                        alignment: .leading,
                        spacing: 6
                    ) {

                        // Toggle Completion Button

                        Button {

                            tasks[index].completed.toggle()

                        } label: {

                            HStack(spacing: 8) {

                                Image(
                                    systemName:
                                        tasks[index].completed
                                        ? "checkmark.circle.fill"
                                        : "circle"
                                )
                                .foregroundStyle(
                                    tasks[index].completed
                                    ? Color.green
                                    : Color.gray
                                )

                                Text(tasks[index].title)
                                    .font(.subheadline)
                                    .lineLimit(2)

                                Spacer(minLength: 0)
                            }
                        }
                        .buttonStyle(.plain)

                        // Separate Details Button

                        NavigationLink {

                            TaskDetailView(
                                task: tasks[index]
                            )

                        } label: {

                            Label(
                                "Details",
                                systemImage: "info.circle"
                            )
                            .font(.caption2)
                        }
                    }
                    .padding(.vertical, 4)
                }
            }
            .listStyle(.plain)
        }
    }
}

#Preview {
    ContentView()
}
