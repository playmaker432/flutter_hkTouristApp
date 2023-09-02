//#Important! Click the "generate tests" button if you have made any changes to this file.

//#Read more about Gherkin syntax https://cucumber.io/docs/gherkin/reference/
//#Read more about bdd_widget_test package https://pub.dev/packages/bdd_widget_test 

//#Example of BDD(Gherkin) syntax:
//#
//#Feature: Counter
//#  Scenario: Initial counter value is 0
//#    Given the app is running
//#    Then I see {'0'} text

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hong Kong Tourist App'),
      ),
      body: ListView(
        children: <Widget>[
          _buildAttractionCard(
            'Victoria Peak',
            'https://www.discoverhongkong.com/eng/images/experiences/victoria-peak.jpg',
            'Enjoy stunning panoramic views of Hong Kong from the top of Victoria Peak.'
          ),
          _buildAttractionCard(
            'Hong Kong Disneyland',
            'https://www.discoverhongkong.com/eng/images/experiences/disneyland.jpg',
            'Experience the magic of Disney at Hong Kong Disneyland.'
          ),
          _buildAttractionCard(
            'Ocean Park',
            'https://www.discoverhongkong.com/eng/images/experiences/ocean-park.jpg',
            'Explore the marine life and thrilling rides at Hong Kong\'s Ocean Park.'
          ),
        ],
      ),
    );
  }

  Widget _buildAttractionCard(String name, String imageUrl, String description) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.network(
            imageUrl,
            fit: BoxFit.cover,
            height: 200,
            width: double.infinity,
          ),
          SizedBox(height: 10),
          Text(
            name,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              description,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 10),
          FlatButton(
            child: Text('Learn More'),
            onPressed: () {
              // TODO: Implement navigation to attraction details page
            },
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}