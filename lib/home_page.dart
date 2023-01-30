import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    final double height = size.height;
    final double width = size.width;

    return Scaffold(
      // App Body
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 2,
            horizontal: 15,
          ),

          // Content
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Welcome, back!",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // Some Space
              SizedBox(
                height: height * .05,
              ),

              Container(
                // Size
                height: height * .1,
                width: width,

                // Padding
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),

                decoration: BoxDecoration(
                  // Colors
                  color: Colors.transparent.withOpacity(
                    0.1,
                  ),

                  // Shape
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    // Text
                    Text(
                      "Search",
                      style: TextStyle(
                        color: Colors.black,
                        //fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    // Icon
                    Icon(
                      Icons.search,
                    ),
                  ],
                ),
              ),

              // Some Space
              SizedBox(
                height: height * .05,
              ),

              const Text(
                "My notes",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // Some Space
              SizedBox(
                height: height * .01,
              ),

              ElevatedButton(
                  onPressed: () {
                    bottonSheetPage(context, size);
                  },
                  child: Text("CLick")),

              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: .7,
                  ),
                  itemCount: 8,
                  itemBuilder: ((context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        // Color
                        color: Colors.blue,

                        // Shape
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          index.toString(),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future bottonSheetPage(BuildContext context, Size size) => showModalBottomSheet(
      // Allow to use total screen size
      isScrollControlled: true,

      context: context,

      builder: ((_) {
        // Size
        final double height = size.height;
        final double width = size.width;

        return SizedBox(
          height: height * .8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                
                height: height * .1,
                width: width * .6,
                color: Colors.black,
                child: Text(
                  "$height $width",
                ),
              ),
            ],
          ),
        );
      }),
    );
