part of '../../home_screen.dart';

class HomeBody extends StatelessWidget {
  final HomeScreenState parent;
  const HomeBody({super.key, required this.parent});

  Widget build(BuildContext context) {
    var filterLetters = SizedBox(
      width: 80,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: AppConstants.letters.length,
        itemBuilder: (context, index) {
          final letter = AppConstants.letters[index];
          return Padding(
            padding: const EdgeInsets.all(5),
            child: FloatingActionButton(
              heroTag: 'herufi_$letter',
              onPressed: () {},
              child: Text(
                AppConstants.letters[index],
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
      ),
    );
    return SafeArea(
      child: Row(
        children: <Widget>[
          filterLetters,
          IndexedStack(
            index: parent.selectedPage,
            children: <Widget>[
              WordsList(parent: parent),
              IdiomsList(parent: parent),
              SayingsList(parent: parent),
              ProverbsList(parent: parent),
            ],
          )
        ],
      ),
    );
  }
}
