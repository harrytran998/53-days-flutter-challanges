import 'dart:io';
import 'package:ansicolor/ansicolor.dart';

void main() {
  final rootDir = Directory.current;
  final regExp = RegExp(
    '^(revert: )?(feat|fix|docs|dx|style|refactor|perf|test|workflow|build|ci|chore|types|wip|release)(\(.+\))?: .{1,50}',
  );

  final textAmber400 = AnsiPen()..rgb(r: 251 / 255, g: 191 / 255, b: 36 / 255);
  final textLightBlue400 = AnsiPen()
    ..rgb(r: 163 / 255, g: 230 / 255, b: 53 / 255);
  final textRed600 = AnsiPen()..rgb(r: 239 / 255, g: 68 / 255, b: 68 / 255);

  final commitFile = File(rootDir.path + '/.git/COMMIT_EDITMSG');
  final commitMessage = commitFile.readAsStringSync();

  final valid = regExp.hasMatch(commitMessage);

  if (!valid) {
    print(textRed600('\nInvalid commit message format'));
    print(textAmber400(
        '\nProper commit message format is required for automated changelog generation\nExamples:\n'));
    print(textLightBlue400('feat(compiler): add comments option`)'));
    print(
        textLightBlue400('fix(reducer): handle events on blur (close #28)\n'));
    exitCode = 1;
  }
}