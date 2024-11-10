import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/watchlist_controller.dart';

class WatchlistScreen extends StatelessWidget {
  final WatchlistController watchlistController = Get.put(WatchlistController());

  WatchlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        // Check if the watchlist is empty
        if (watchlistController.courses.isEmpty) {
          return const Center(
            child: Text('No courses in wishlist', style: TextStyle(color: Colors.white)),
          );
        }

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with item count
              Text(
                '${watchlistController.courses.length} Courses in Wishlist',
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
              // Expanded List of courses
              Expanded(
                child: ListView.builder(
                  itemCount: watchlistController.courses.length,
                  itemBuilder: (context, index) {
                    var course = watchlistController.courses[index];
                    return Card(
                      color: Colors.grey[850],
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: ListTile(
                        leading: Image.network('https://via.placeholder.com/150'), // Replace with actual image
                        title: Text(
                         "${course["title"]}",
                          style: const TextStyle(color: Colors.white,
                          fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '${course['rating']} ★',
                                  style: const TextStyle(color: Colors.yellow),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  '(${course['reviewCount']} reviews)',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            Text(
                              '${course['totalCourses']} • ${course['lesson']} • ${course['level']}',
                              style: const TextStyle(color: Colors.white54),
                            ),
                          ],
                        ),
                        // trailing: Column(
                        //   children: [
                        //     Text(
                        //       'Rs. ${course['price']}',
                        //       style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        //     ),
                        //     IconButton(
                        //       icon: const Icon(Icons.delete, color: Colors.red),
                        //       onPressed: () {
                        //         watchlistController.removeCourse(index);
                        //       },
                        //     ),
                        //   ],
                        // ),
                      ),
                    );
                  },
                ),
              ),

              // Total and Buy Now Button
              SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  color: Colors.grey[900],
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Total:',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          Text(
                            'Rs. ${watchlistController.totalPrice}',
                            style: const TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // Logic for buying the courses
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.yellow, // Background color
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: const Text(
                            'Buy Now',
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
      backgroundColor: Colors.black,
    );
  }
}
