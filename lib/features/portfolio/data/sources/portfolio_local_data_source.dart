import '../models/project_model.dart';
import '../models/skill_model.dart';

abstract class PortfolioDataSource {
  Future<List<ProjectModel>> getProjects();
  Future<List<SkillModel>> getSkills();
}

class PortfolioLocalDataSourceImpl implements PortfolioDataSource {
  @override
  Future<List<ProjectModel>> getProjects() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      const ProjectModel(
        title: "E-Commerce App",
        category: "Mobile",
        description:
            "A full-featured e-commerce application built with Flutter and Firebase.",
        longDescription:
            "A comprehensive shopping experience featuring real-time inventory, secure payments with Stripe integration, and automated order tracking. Built using the Bloc pattern for state management and Firebase as the backend.",
        features: [
          "Stripe Integration",
          "Push Notifications",
          "Inventory Tracking",
          "User Profiles",
        ],
        imageUrl:
            "https://images.unsplash.com/photo-1557821552-17105176677c?w=800&q=80",
        link: "https://github.com",
        techStack: ["Flutter", "Firebase", "Stripe"],
      ),
      const ProjectModel(
        title: "AI Chat Bot",
        category: "AI/ML",
        description:
            "Intelligent chatbot powered by OpenAI's GPT-4, featuring real-time responses.",
        longDescription:
            "Leverages cutting-edge LLMs to provide human-like interactions. Includes multi-modal support for text and images, conversation history, and fine-tuned domain-specific knowledge bases.",
        features: [
          "Multi-modal Support",
          "Real-time Streaming",
          "Conversation History",
          "Custom Fine-tuning",
        ],
        imageUrl:
            "https://images.unsplash.com/photo-1677442136019-21780ecad995?w=800&q=80",
        link: "https://github.com",
        techStack: ["Flutter", "OpenAI", "Cloud Functions"],
      ),
      const ProjectModel(
        title: "Task Management System",
        category: "Web",
        description:
            "A robust task management system with team collaboration features.",
        longDescription:
            "A productivity powerhouse that helps teams stay organized. Featuring kanban boards, Gantt charts, time tracking, and deep integration with Slack and Jira. Built with Flutter Web for desktop-grade performance.",
        features: [
          "Kanban Boards",
          "Time Tracking",
          "Collaboration Hub",
          "Gantt Charts",
        ],
        imageUrl:
            "https://images.unsplash.com/photo-1540350394557-8d14678e7f91?w=800&q=80",
        link: "https://github.com",
        techStack: ["Flutter", "Riverpod", "Clean Architecture"],
      ),
      const ProjectModel(
        title: "Fitness Tracker",
        category: "Mobile",
        description:
            "Health & fitness app tracking steps, calories, and workouts.",
        longDescription:
            "Comprehensive health companion that integrates with Google Fit and Apple Health. Native performance with Flutter, real-time heart rate monitoring, and AI-driven personalized workout recommendations.",
        features: [
          "Health Kit Sync",
          "GPS Tracking",
          "AI Workouts",
          "Social Sharing",
        ],
        imageUrl:
            "https://images.unsplash.com/photo-1476480862126-209bfaa8edc8?w=800&q=80",
        link: "https://github.com",
        techStack: ["Flutter", "SQLite", "HealthKit"],
      ),
      const ProjectModel(
        title: "Recipe App",
        category: "Mobile",
        description: "Explore culinary delights with thousands of recipes.",
        longDescription:
            "Your digital cookbook with over 10,000 recipes. Includes meal planning, grocery list auto-generation, and step-by-step video guides. Features an offline mode for use in the kitchen.",
        features: [
          "Video Guides",
          "Meal Planner",
          "Ingredient Parsing",
          "Offline Mode",
        ],
        imageUrl:
            "https://images.unsplash.com/photo-1556910103-1c02745aae4d?w=800&q=80",
        link: "https://github.com",
        techStack: ["Flutter", "GraphQL", "Hive"],
      ),
      const ProjectModel(
        title: "Crypto Dashboard",
        category: "Web",
        description: "Real-time cryptocurrency tracking and analysis tool.",
        longDescription:
            "Finance-grade dashboard for the crypto enthusiast. Real-time candle charts, portfolio management, and news aggregation. Built with high-performance web sockets for sub-millisecond updates.",
        features: [
          "Web Sockets",
          "Advanced Charting",
          "Portfolio Tracking",
          "Arbitrage Alerts",
        ],
        imageUrl:
            "https://images.unsplash.com/photo-1621761191319-c6fb62004040?w=800&q=80",
        link: "https://github.com",
        techStack: ["Flutter", "Socket.io", "Syncfusion"],
      ),
    ];
  }

  @override
  Future<List<SkillModel>> getSkills() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return [
      const SkillModel(name: "Flutter", iconPath: "", category: "Mobile"),
      const SkillModel(name: "React Native", iconPath: "", category: "Mobile"),
      const SkillModel(name: "Dart", iconPath: "", category: "Languages"),
      const SkillModel(name: "JavaScript", iconPath: "", category: "Languages"),
      const SkillModel(name: "Python", iconPath: "", category: "Languages"),
      const SkillModel(name: "Kotlin", iconPath: "", category: "Languages"),
      const SkillModel(name: "Swift", iconPath: "", category: "Languages"),
      const SkillModel(name: "React.js", iconPath: "", category: "Web"),
      const SkillModel(name: "Node.js", iconPath: "", category: "Backend"),
      const SkillModel(name: "AWS", iconPath: "", category: "Cloud"),
      const SkillModel(name: "Git & GitHub", iconPath: "", category: "Tools"),
      const SkillModel(name: "Docker", iconPath: "", category: "DevOps"),
      const SkillModel(name: "Figma", iconPath: "", category: "Design"),
    ];
  }
}
