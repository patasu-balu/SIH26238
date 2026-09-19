import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';

class DashboardScreen extends StatelessWidget {
  final Function(int index)? onNavigateToTab;

  const DashboardScreen({super.key, this.onNavigateToTab});

  void _showNotificationSheet(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Notifications: 2 new updates available'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppStrings.appTitle,
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0.3),
        ),
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_none_rounded),
                tooltip: 'Notifications',
                onPressed: () => _showNotificationSheet(context),
              ),
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: AppColors.secondary,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 4),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. WELCOME SECTION & COMPACT PROFILE CARD
            _buildWelcomeHeader(context, isDark),

            const SizedBox(height: 16),

            _buildStudentProfileCard(context, isDark),

            const SizedBox(height: 24),

            // 2. QUICK ACTIONS
            _buildSectionHeader(context, AppStrings.quickActionsTitle),
            const SizedBox(height: 12),
            _buildQuickActionsGrid(context, isDark),

            const SizedBox(height: 24),

            // 3. APPLICATION STATUS CARD
            _buildSectionHeader(context, AppStrings.myApplicationsTitle),
            const SizedBox(height: 12),
            _buildApplicationStatusCard(context, isDark),

            const SizedBox(height: 24),

            // 4. RECOMMENDED SCHOLARSHIPS
            _buildSectionHeader(context, AppStrings.recommendedTitle),
            const SizedBox(height: 12),
            _buildScholarshipCards(context, isDark),

            const SizedBox(height: 24),

            // 5. RECENT UPDATES
            _buildSectionHeader(context, AppStrings.recentUpdatesTitle),
            const SizedBox(height: 12),
            _buildRecentUpdates(context, isDark),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  // --- WELCOME HEADER ---
  Widget _buildWelcomeHeader(BuildContext context, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.welcomeBack,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: isDark
                ? AppColors.textPrimaryDark
                : AppColors.textPrimaryLight,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          AppStrings.welcomeSubtitle,
          style: TextStyle(
            fontSize: 14,
            color: isDark
                ? AppColors.textSecondaryDark
                : AppColors.textSecondaryLight,
          ),
        ),
      ],
    );
  }

  // --- STUDENT PROFILE CARD ---
  Widget _buildStudentProfileCard(BuildContext context, bool isDark) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: AppColors.avatarBg,
              child: const Text(
                'R',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.avatarText,
                ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.studentName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      AppStrings.studentRole,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: isDark
                            ? AppColors.primaryLight
                            : AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            OutlinedButton(
              onPressed: () {
                if (onNavigateToTab != null) {
                  onNavigateToTab!(4); // Navigate to Profile tab
                }
              },
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8,
                ),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                side: BorderSide(
                  color: isDark ? AppColors.primaryLight : AppColors.primary,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                AppStrings.profileBtn,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: isDark ? AppColors.primaryLight : AppColors.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- SECTION HEADER ---
  Widget _buildSectionHeader(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleMedium
          ?.copyWith(fontWeight: FontWeight.bold, letterSpacing: 0.2),
    );
  }

  // --- QUICK ACTIONS GRID ---
  Widget _buildQuickActionsGrid(BuildContext context, bool isDark) {
    final actions = [
      {
        'icon': Icons.school_outlined,
        'title': AppStrings.actionFindScholarships,
        'tabIndex': 1,
      },
      {
        'icon': Icons.folder_shared_outlined,
        'title': AppStrings.actionDocumentWallet,
        'tabIndex': 3,
      },
      {
        'icon': Icons.assignment_outlined,
        'title': AppStrings.actionMyApplications,
        'tabIndex': 2,
      },
      {
        'icon': Icons.near_me_outlined,
        'title': AppStrings.actionTrackApplication,
        'tabIndex': 2,
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: actions.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 2.2,
      ),
      itemBuilder: (context, index) {
        final item = actions[index];
        final icon = item['icon'] as IconData;
        final title = item['title'] as String;
        final tabIndex = item['tabIndex'] as int;

        return Material(
          color: isDark ? AppColors.darkCard : Colors.white,
          borderRadius: BorderRadius.circular(12),
          elevation: 1,
          child: InkWell(
            onTap: () {
              if (onNavigateToTab != null) {
                onNavigateToTab!(tabIndex);
              }
            },
            borderRadius: BorderRadius.circular(12),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
                ),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      icon,
                      size: 20,
                      color: isDark
                          ? AppColors.primaryLight
                          : AppColors.primary,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        height: 1.2,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // --- APPLICATION STATUS CARD ---
  Widget _buildApplicationStatusCard(BuildContext context, bool isDark) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    AppStrings.sampleAppTitle,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.statusUnderVerificationBg,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    AppStrings.sampleAppStatus,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: AppColors.statusUnderVerificationText,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 14),

            // Progress Bar & Percentage
            Row(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: LinearProgressIndicator(
                      value: AppStrings.sampleAppProgress,
                      minHeight: 8,
                      backgroundColor: isDark
                          ? AppColors.darkBackground
                          : Colors.grey.shade200,
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        AppColors.primary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  '${(AppStrings.sampleAppProgress * 100).toInt()}%',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: isDark ? AppColors.primaryLight : AppColors.primary,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Horizontal Stage Timeline
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: List.generate(AppStrings.applicationStages.length, (
                  index,
                ) {
                  final stage = AppStrings.applicationStages[index];
                  final isCompleted = index < 2;
                  final isActive = index == 2;
                  final isLast =
                      index == AppStrings.applicationStages.length - 1;

                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Step Column (Node + Label)
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 26,
                            height: 26,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isCompleted
                                  ? AppColors.stageCompleted
                                  : (isActive
                                        ? AppColors.primary
                                        : (isDark
                                              ? AppColors.stagePendingDark
                                              : AppColors.stagePendingLight)),
                              border: isActive
                                  ? Border.all(
                                      color: isDark
                                          ? AppColors.primaryLight
                                          : AppColors.primary,
                                      width: 2,
                                    )
                                  : null,
                            ),
                            child: Center(
                              child: isCompleted
                                  ? const Icon(
                                      Icons.check,
                                      size: 16,
                                      color: Colors.white,
                                    )
                                  : Text(
                                      '${index + 1}',
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                        color: (isCompleted || isActive)
                                            ? Colors.white
                                            : (isDark
                                                  ? Colors.white60
                                                  : Colors.black54),
                                      ),
                                    ),
                            ),
                          ),
                          const SizedBox(height: 6),
                          SizedBox(
                            width: 80,
                            child: Text(
                              stage,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: isActive
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                                color: isActive
                                    ? (isDark
                                          ? AppColors.textPrimaryDark
                                          : AppColors.textPrimaryLight)
                                    : (isDark
                                          ? AppColors.textSecondaryDark
                                          : AppColors.textSecondaryLight),
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),

                      // Connector Line (unless last item)
                      if (!isLast)
                        Container(
                          width: 32,
                          height: 2,
                          margin: const EdgeInsets.only(bottom: 20),
                          color: isCompleted
                              ? AppColors.stageCompleted
                              : (isDark
                                    ? AppColors.stagePendingDark
                                    : AppColors.stagePendingLight),
                        ),
                    ],
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- RECOMMENDED SCHOLARSHIPS ---
  Widget _buildScholarshipCards(BuildContext context, bool isDark) {
    final scholarships = [
      {
        'title': AppStrings.scholarship1Title,
        'desc': AppStrings.scholarship1Desc,
        'deadline': AppStrings.scholarship1Deadline,
        'badge': AppStrings.scholarship1Badge,
      },
      {
        'title': AppStrings.scholarship2Title,
        'desc': AppStrings.scholarship2Desc,
        'deadline': AppStrings.scholarship2Deadline,
        'badge': AppStrings.scholarship2Badge,
      },
    ];

    return Column(
      children: scholarships.map((scholarship) {
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          child: Card(
            margin: EdgeInsets.zero,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          scholarship['title']!,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.badgeEligibleBg,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          scholarship['badge']!,
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: AppColors.badgeEligibleText,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    scholarship['desc']!,
                    style: TextStyle(
                      fontSize: 13,
                      height: 1.3,
                      color: isDark
                          ? AppColors.textSecondaryDark
                          : AppColors.textSecondaryLight,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today_outlined,
                            size: 14,
                            color: isDark
                                ? AppColors.textSecondaryDark
                                : AppColors.textSecondaryLight,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            scholarship['deadline']!,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: isDark
                                  ? AppColors.textSecondaryDark
                                  : AppColors.textSecondaryLight,
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).clearSnackBars();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Details for ${scholarship['title']}',
                              ),
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 8,
                          ),
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          textStyle: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        child: const Text('View Details'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  // --- RECENT UPDATES ---
  Widget _buildRecentUpdates(BuildContext context, bool isDark) {
    final updates = [
      {
        'text': AppStrings.update1Text,
        'time': AppStrings.update1Time,
        'icon': Icons.update_rounded,
      },
      {
        'text': AppStrings.update2Text,
        'time': AppStrings.update2Time,
        'icon': Icons.new_releases_outlined,
      },
    ];

    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: List.generate(updates.length, (index) {
            final update = updates[index];
            final isLast = index == updates.length - 1;

            return Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        update['icon'] as IconData,
                        size: 18,
                        color: isDark
                            ? AppColors.primaryLight
                            : AppColors.primary,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            update['text'] as String,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            update['time'] as String,
                            style: TextStyle(
                              fontSize: 11,
                              color: isDark
                                  ? AppColors.textSecondaryDark
                                  : AppColors.textSecondaryLight,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                if (!isLast)
                  Divider(
                    height: 20,
                    thickness: 1,
                    color: isDark
                        ? AppColors.darkBorder
                        : AppColors.lightBorder,
                  ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
