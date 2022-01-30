import '../backend/api_requests/api_calls.dart';
import '../department_highlights_page/department_highlights_page_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.secondaryColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(-2.02, -28.5),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 60, 20, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 15, 0, 20),
                            child: Text(
                              'Categories',
                              style: FlutterFlowTheme.title1.override(
                                fontFamily: 'Playfair Display',
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                        FutureBuilder<ApiCallResponse>(
                          future: GetDepartmentsCall.call(),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: CircularProgressIndicator(
                                    color: FlutterFlowTheme.primaryColor,
                                  ),
                                ),
                              );
                            }
                            final gridViewGetDepartmentsResponse =
                                snapshot.data;
                            return Builder(
                              builder: (context) {
                                final departments = (getJsonField(
                                          (gridViewGetDepartmentsResponse
                                                  ?.jsonBody ??
                                              ''),
                                          r'''$.departments''',
                                        )?.toList() ??
                                        [])
                                    .take(30)
                                    .toList();
                                return GridView.builder(
                                  padding: EdgeInsets.zero,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                    childAspectRatio: 1.6,
                                  ),
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: departments.length,
                                  itemBuilder: (context, departmentsIndex) {
                                    final departmentsItem =
                                        departments[departmentsIndex];
                                    return InkWell(
                                      onTap: () async {
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                DepartmentHighlightsPageWidget(
                                              departmentId: getJsonField(
                                                departmentsItem,
                                                r'''$.departmentId''',
                                              ),
                                              displayName: getJsonField(
                                                departmentsItem,
                                                r'''$.displayName''',
                                              ).toString(),
                                            ),
                                          ),
                                        );
                                      },
                                      child: Card(
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        color: Colors.white,
                                        elevation: 4,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Align(
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5, 0, 5, 0),
                                            child: Text(
                                              getJsonField(
                                                departmentsItem,
                                                r'''$.displayName''',
                                              ).toString(),
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.title1,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
