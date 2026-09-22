import 'dart:async';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// Types out [lines] one character at a time, alternating "command" and
/// "output" styling by index (even = command, odd = output), then leaves
/// a blinking cursor on the final line. This is the page's one deliberate
/// motion moment — everything else on the page is static.
class TerminalTyper extends StatefulWidget {
  final List<String> lines;
  final Duration charInterval;
  final Duration lineGap;

  const TerminalTyper({
    super.key,
    required this.lines,
    this.charInterval = const Duration(milliseconds: 16),
    this.lineGap = const Duration(milliseconds: 260),
  });

  @override
  State<TerminalTyper> createState() => _TerminalTyperState();
}

class _TerminalTyperState extends State<TerminalTyper> with SingleTickerProviderStateMixin {
  final List<String> _typed = [];
  int _lineIndex = 0;
  int _charIndex = 0;
  Timer? _timer;
  late final AnimationController _cursorController;

  @override
  void initState() {
    super.initState();
    _cursorController = AnimationController(vsync: this, duration: const Duration(milliseconds: 900))
      ..repeat(reverse: true);
    _typed.addAll(List.filled(widget.lines.length, ''));
    _scheduleNextChar();
  }

  void _scheduleNextChar() {
    _timer = Timer(widget.charInterval, _advance);
  }

  void _advance() {
    if (!mounted) return;
    if (_lineIndex >= widget.lines.length) return;
    final line = widget.lines[_lineIndex];
    if (_charIndex < line.length) {
      setState(() {
        _typed[_lineIndex] = line.substring(0, _charIndex + 1);
        _charIndex++;
      });
      _scheduleNextChar();
    } else {
      _lineIndex++;
      _charIndex = 0;
      if (_lineIndex < widget.lines.length) {
        _timer = Timer(widget.lineGap, _advance);
      }
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _cursorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final finishedTyping = _lineIndex >= widget.lines.length;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < widget.lines.length; i++)
          if (_typed[i].isNotEmpty || i < _lineIndex)
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: RichText(
                text: TextSpan(
                  style: AppText.mono(
                    context,
                    size: 14,
                    color: i.isEven ? AppColors.accent : AppColors.textMuted,
                    weight: i.isEven ? FontWeight.w600 : FontWeight.w400,
                  ),
                  children: [
                    TextSpan(text: _typed[i]),
                    if ((i == _lineIndex && !finishedTyping) ||
                        (finishedTyping && i == widget.lines.length - 1))
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: FadeTransition(
                          opacity: _cursorController,
                          child: Container(
                            margin: const EdgeInsets.only(left: 4),
                            width: 8,
                            height: 15,
                            color: AppColors.accent,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
      ],
    );
  }
}
