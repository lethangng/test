import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html_table/flutter_html_table.dart';
// import 'package:flutter_html_all/flutter_html_all.dart';

class Test5Screen extends StatefulWidget {
  const Test5Screen({super.key});

  // final String title;

  @override
  Test5ScreenState createState() => Test5ScreenState();
}

const htmlData = r"""
<p id='top'><a href='#bottom'>Scroll to bottom</a></p>
      <h1>Header 1</h1>
      <h2>Header 2</h2>
      <h3>Header 3</h3>
      <h4>Header 4</h4>
      <h5>Header 5</h5>
      <h6>Header 6</h6>
     
    <table class="additional-attributes data table cke_show_border" style="-webkit-text-stroke-width:0px;border-collapse:collapse;border-spacing:0px;color:rgb(0, 0, 0);font-family:&quot;roboto condensed&quot;, &quot;helvetica neue&quot;, helvetica, arial, sans-serif;font-size:15px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;max-width:100%;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-transform:none;white-space:normal;widows:2;word-spacing:0px;">
        <tbody>
            <tr>
                <th style="border:1px dotted rgb(211, 211, 211);text-align:left;vertical-align:top;" scope="row">
                    Form
                </th>
                <td style="border:1px dotted rgb(211, 211, 211);vertical-align:top;">
                    Freesize
                </td>
            </tr>
            <tr>
                <th style="border:1px dotted rgb(211, 211, 211);text-align:left;vertical-align:top;" scope="row">
                    Chất liệu
                </th>
                <td style="border:1px dotted rgb(211, 211, 211);vertical-align:top;">
                    Da
                </td>
            </tr>
            <tr>
                <th style="border:1px dotted rgb(211, 211, 211);text-align:left;vertical-align:top;" scope="row">
                    Thiết kế
                </th>
                <td style="border:1px dotted rgb(211, 211, 211);vertical-align:top;">
                    Trơn
                </td>
            </tr>
            <tr>
                <th style="border:1px dotted rgb(211, 211, 211);text-align:left;vertical-align:top;" scope="row">
                    Giới tính
                </th>
                <td style="border:1px dotted rgb(211, 211, 211);vertical-align:top;">
                    Nữ
                </td>
            </tr>
            <tr>
                <th style="border:1px dotted rgb(211, 211, 211);text-align:left;vertical-align:top;" scope="row">
                    Nhóm sản phẩm
                </th>
                <td style="border:1px dotted rgb(211, 211, 211);vertical-align:top;">
                    Phụ kiện
                </td>
            </tr>
        </tbody>
    </table>

      
      <h2>Inline Styles:</h2>
      <p>The should be <span style='color: blue;'>BLUE style='color: blue;'</span></p>
      <p>The should be <span style='color: red;'>RED style='color: red;'</span></p>
      <p>The should be <span style='color: rgba(0, 0, 0, 0.10);'>BLACK with 10% alpha style='color: rgba(0, 0, 0, 0.10);</span></p>
      <p>The should be <span style='color: rgb(0, 97, 0);'>GREEN style='color: rgb(0, 97, 0);</span></p>
      <p>The should be <span style='background-color: red; color: rgb(0, 97, 0);'>GREEN style='color: rgb(0, 97, 0);</span></p>
      
      <h2>Text Alignment</h2>
      <p style="text-align: center;"><span style="color: rgba(0, 0, 0, 0.95);">Center Aligned Text</span></p>
      <p style="text-align: right;"><span style="color: rgba(0, 0, 0, 0.95);">Right Aligned Text</span></p>
      <p style="text-align: justify;"><span style="color: rgba(0, 0, 0, 0.95);">Justified Text</span></p>
      <p style="text-align: center;"><span style="color: rgba(0, 0, 0, 0.95);">Center Aligned Text</span></p>
      
      <h2>Margins</h2>
      <div style="width: 350px; height: 20px; text-align: center; background-color: #ff9999;">Default Div (width 350px height 20px)</div>
      <div style="width: 350px; height: 20px; text-align: center; background-color: #ffff99; margin-left: 3em;">margin-left: 3em</div>
      <div style="width: 350px; height: 20px; text-align: center; background-color: #99ff99; margin: auto;">margin: auto</div>
      <div style="width: 350px; height: 20px; text-align: center; background-color: #ff99ff; margin: 15px auto;">margin: 15px auto</div>
      <div style="width: 350px; height: 20px; text-align: center; background-color: #9999ff; margin-left: auto;">margin-left: auto</div>
      <div style="width: 350px; height: 20px; text-align: center; background-color: #99ffff; margin-right: auto;">margin-right: auto</div>
      <div style="width: 350px; height: 20px; text-align: center; background-color: #999999; margin-left: auto; margin-right: 3em;">margin-left: auto; margin-right: 3em</div>
      
      <h4>Margin Auto on Image</h4>
      <p>display:inline-block; margin: auto; (should not center):</p>
      <img alt='' style="margin: auto;" width="100" src="https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_92x30dp.png">
      <p>display:block margin: auto; (should center):</p>
      <img alt='' style="display: block; margin: auto;" width="100" src="https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_92x30dp.png">
      
      <h2>Support for <code>sub</code>/<code>sup</code></h2>
      Solve for <var>x<sub>n</sub></var>: log<sub>2</sub>(<var>x</var><sup>2</sup>+<var>n</var>) = 9<sup>3</sup>
      <p>One of the most <span>common</span> equations in all of physics is <br /><var>E</var>=<var>m</var><var>c</var><sup>2</sup>.</p>
    
      <h2>Support for maxLines:</h2>
      <h5>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vestibulum sapien feugiat lorem tempor, id porta orci elementum. Fusce sed justo id arcu egestas congue. Fusce tincidunt lacus ipsum, in imperdiet felis ultricies eu. In ullamcorper risus felis, ac maximus dui bibendum vel. Integer ligula tortor, facilisis eu mauris ut, ultrices hendrerit ex. Donec scelerisque massa consequat, eleifend mauris eu, mollis dui. Donec placerat augue tortor, et tincidunt quam tempus non. Quisque sagittis enim nisi, eu condimentum lacus egestas ac. Nam facilisis luctus ipsum, at aliquam urna fermentum a. Quisque tortor dui, faucibus in ante eget, pellentesque mattis nibh. In augue dolor, euismod vitae eleifend nec, tempus vel urna. Donec vitae augue accumsan ligula fringilla ultrices et vel ex.</h5>
      
      <h2>List support:</h2>
      <ol>
            <li>This</li>
            <li><p>is</p></li>
            <li>an</li>
            <li>
            ordered
            <ul>
            <li>With<br /><br />...</li>
            <li>a</li>
            <li>nested</li>
            <li>unordered
            <ol style="list-style-type: lower-alpha;" start="5">
            <li>With a nested</li>
            <li>ordered list</li>
            <li>with a lower alpha list style</li>
            <li>starting at letter e</li>
            </ol>
            </li>
            <li>list</li>
            </ul>
            </li>
            <li>list! Lorem ipsum dolor sit amet.</li>
            <li><h2>Header 2</h2></li>
            <h2><li>Header 2</li></h2>
      </ol>
      <p id='bottom'><a href='#top'>Scroll to top</a></p>
""";

final staticAnchorKey = GlobalKey();

class Test5ScreenState extends State<Test5Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('flutter_html Example'),
        centerTitle: true,
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: const Icon(Icons.arrow_downward),
      //   onPressed: () {
      //     final anchorContext =
      //         AnchorKey.forId(staticAnchorKey, "bottom")?.currentContext;
      //     if (anchorContext != null) {
      //       Scrollable.ensureVisible(anchorContext);
      //     }
      //   },
      // ),
      body: SingleChildScrollView(
        child: Html(
          anchorKey: staticAnchorKey,
          data: htmlData,
          shrinkWrap: true,
          style: {
            "table": Style(
              height: Height.auto(),
              width: Width.auto(),
            ),
            "tr": Style(
              height: Height.auto(),
              width: Width.auto(),
            ),
            "th": Style(
              padding: HtmlPaddings.all(6),
              height: Height.auto(),
              border: const Border(
                left: BorderSide(color: Colors.black, width: 0.5),
                bottom: BorderSide(color: Colors.black, width: 0.5),
                top: BorderSide(color: Colors.black, width: 0.5),
              ),
            ),
            "td": Style(
              padding: HtmlPaddings.all(6),
              height: Height.auto(),
              border: const Border(
                left: BorderSide(color: Colors.black, width: 0.5),
                bottom: BorderSide(color: Colors.black, width: 0.5),
                top: BorderSide(color: Colors.black, width: 0.5),
                right: BorderSide(color: Colors.black, width: 0.5),
              ),
            ),
            "col": Style(
              height: Height.auto(),
              width: Width.auto(),
            ),
          },
          extensions: const [TableHtmlExtension()],
        ),
      ),
    );
  }
}
