import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ArtPiecePageWidget extends StatefulWidget {
  const ArtPiecePageWidget({
    Key key,
    this.artPiece,
  }) : super(key: key);

  final dynamic artPiece;

  @override
  _ArtPiecePageWidgetState createState() => _ArtPiecePageWidgetState();
}

class _ArtPiecePageWidgetState extends State<ArtPiecePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference),
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
        final artPiecePageUsersRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: true,
            leading: InkWell(
              onTap: () async {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 24,
              ),
            ),
            title: Text(
              getJsonField(
                widget.artPiece,
                r'''$.title''',
              ).toString(),
              style: FlutterFlowTheme.bodyText2.override(
                fontFamily: 'Playfair Display',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              ToggleIcon(
                onPressed: () async {
                  final favoritesElement = getJsonField(
                    widget.artPiece,
                    r'''$.objectID''',
                  );
                  final favoritesUpdate = artPiecePageUsersRecord.favorites
                          .toList()
                          .contains(favoritesElement)
                      ? FieldValue.arrayRemove([favoritesElement])
                      : FieldValue.arrayUnion([favoritesElement]);
                  final usersUpdateData = {
                    'favorites': favoritesUpdate,
                  };
                  await artPiecePageUsersRecord.reference
                      .update(usersUpdateData);
                },
                value: artPiecePageUsersRecord.favorites
                    .toList()
                    .contains(getJsonField(
                      widget.artPiece,
                      r'''$.objectID''',
                    )),
                onIcon: Icon(
                  Icons.shopping_cart,
                  color: FlutterFlowTheme.primaryColor,
                  size: 25,
                ),
                offIcon: Icon(
                  Icons.shopping_cart,
                  color: FlutterFlowTheme.tertiaryColor,
                  size: 25,
                ),
              ),
            ],
            centerTitle: true,
            elevation: 0,
          ),
          backgroundColor: FlutterFlowTheme.secondaryColor,
          body: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Image.network(
                          getJsonField(
                            widget.artPiece,
                            r'''$.primaryImage''',
                          ),
                          width: double.infinity,
                          height: 400,
                          fit: BoxFit.fitWidth,
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(15, 20, 15, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                getJsonField(
                                  widget.artPiece,
                                  r'''$.title''',
                                ).toString(),
                                style: FlutterFlowTheme.title1.override(
                                  fontFamily: 'Playfair Display',
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 5),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 6, 0),
                                      child: Text(
                                        getJsonField(
                                          widget.artPiece,
                                          r'''$.artistDisplayName''',
                                        ).toString(),
                                        style:
                                            FlutterFlowTheme.bodyText2.override(
                                          fontFamily: 'Playfair Display',
                                          color: FlutterFlowTheme.tertiaryColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: AutoSizeText(
                                        getJsonField(
                                          widget.artPiece,
                                          r'''$.artistDisplayName''',
                                        ).toString(),
                                        style:
                                            FlutterFlowTheme.bodyText2.override(
                                          fontFamily: 'Playfair Display',
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Divider(
                                    height: 30,
                                    thickness: 0.5,
                                    color: FlutterFlowTheme.tertiaryColor,
                                  ),
                                  Text(
                                    'Title',
                                    style: FlutterFlowTheme.bodyText2.override(
                                      fontFamily: 'Playfair Display',
                                      color: Color(0xFF1E2429),
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 2, 0, 0),
                                    child: Text(
                                      getJsonField(
                                        widget.artPiece,
                                        r'''$.title''',
                                      ).toString(),
                                      style:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Playfair Display',
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Divider(
                                    height: 30,
                                    thickness: 0.5,
                                    color: FlutterFlowTheme.tertiaryColor,
                                  ),
                                  Text(
                                    'Maker',
                                    style: FlutterFlowTheme.bodyText2.override(
                                      fontFamily: 'Playfair Display',
                                      color: Color(0xFF1E2429),
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 2, 0, 0),
                                    child: Text(
                                      getJsonField(
                                        widget.artPiece,
                                        r'''$.artistDisplayName''',
                                      ).toString(),
                                      style:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Playfair Display',
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Divider(
                                    height: 30,
                                    thickness: 0.5,
                                    color: FlutterFlowTheme.tertiaryColor,
                                  ),
                                  Text(
                                    'Department',
                                    style: FlutterFlowTheme.bodyText2.override(
                                      fontFamily: 'Playfair Display',
                                      color: Color(0xFF1E2429),
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 2, 0, 0),
                                    child: Text(
                                      getJsonField(
                                        widget.artPiece,
                                        r'''$.department''',
                                      ).toString(),
                                      style:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Playfair Display',
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Divider(
                                    height: 30,
                                    thickness: 0.5,
                                    color: FlutterFlowTheme.tertiaryColor,
                                  ),
                                  Text(
                                    'Accesion Number',
                                    style: FlutterFlowTheme.bodyText2.override(
                                      fontFamily: 'Playfair Display',
                                      color: Color(0xFF1E2429),
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 2, 0, 0),
                                    child: Text(
                                      getJsonField(
                                        widget.artPiece,
                                        r'''$.accessionNumber''',
                                      ).toString(),
                                      style:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Playfair Display',
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 84,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.secondaryColor,
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        final usersUpdateData = {
                          'favorites': FieldValue.arrayUnion([
                            getJsonField(
                              widget.artPiece,
                              r'''$.objectID''',
                            )
                          ]),
                        };
                        await currentUserReference.update(usersUpdateData);
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                NavBarPage(initialPage: 'MyCollection'),
                          ),
                        );
                      },
                      text: 'Add to Cart',
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                        size: 15,
                      ),
                      options: FFButtonOptions(
                        width: 200,
                        height: 50,
                        color: FlutterFlowTheme.primaryColor,
                        textStyle: FlutterFlowTheme.subtitle1.override(
                          fontFamily: 'Playfair Display',
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: 6,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
