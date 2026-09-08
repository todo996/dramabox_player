import 'package:flutter/material.dart';

/// A full-screen error widget displayed when the API blocks access (429 or 403).
///
/// Shows a shield icon, a headline, a short explanation, and a retry button.
class RateLimitErrorWidget extends StatelessWidget {
  final VoidCallback? onRetry;

  const RateLimitErrorWidget({super.key, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.amber.withValues(alpha: 0.12),
              ),
              child: const Icon(
                Icons.shield_outlined,
                size: 40,
                color: Colors.amber,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Máy chủ tạm thời không khả dụng',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Máy chủ API đang tạm chặn yêu cầu do lưu lượng truy cập cao. Vui lòng chờ một lúc rồi thử lại.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 14,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 28),
            if (onRetry != null)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: onRetry,
                  icon: const Icon(Icons.refresh, size: 18),
                  label: const Text('Thử lại'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
