module Main exposing (..)

import Browser
import Element
import Element.Background
import Element.Font
import Element.Input
import Element.Border
import Html exposing(Html)
import Element.Region

main : Program () Model Msg
main =
    Browser.sandbox
        { init = darkColors
        , view = viewLayout
        , update = update
        }

type Msg = MsgChangeColors

update : Msg -> Model -> Model
update msg model =
    if model.primary == darkColors.primary then
        lightColors
    else
        darkColors

darkColors : Model
darkColors =
    { primary = Element.rgb255 0xFF 0xAB 0x00
    , primaryLight = Element.rgb255 0xFF 0xDD 0x4B
    , primaryDark = Element.rgb255 0xC6 0x7C 0x00
    , secondary = Element.rgb255 0x3E 0x27 0x23
    , secondaryLight = Element.rgb255 0x6A 0x4F 0x4B
    , secondaryDark = Element.rgb255 0x1B 0x00 0x00
    , textOnPrimary = Element.rgb255 0x00 0x00 0x00
    , textOnSecondary = Element.rgb255 0xFF 0xFF 0xFF
    }

lightColors : Model
lightColors =
    { secondary = Element.rgb255 0xFF 0xAB 0x00
    , secondaryLight = Element.rgb255 0xFF 0xDD 0x4B
    , secondaryDark = Element.rgb255 0xC6 0x7C 0x00
    , primary = Element.rgb255 0x3E 0x27 0x23
    , primaryLight = Element.rgb255 0x6A 0x4F 0x4B
    , primaryDark = Element.rgb255 0x1B 0x00 0x00
    , textOnSecondary = Element.rgb255 0x00 0x00 0x00
    , textOnPrimary = Element.rgb255 0xFF 0xFF 0xFF
    }

fontGreatVibes : Element.Attribute msg
fontGreatVibes =
    Element.Font.family [ Element.Font.typeface "GreatVibes" ]

fontTypewriter : Element.Attribute msg
fontTypewriter =
    Element.Font.family [ Element.Font.typeface "Typewriter" ]

type alias Model =
    { primaryDark : Element.Color
    , secondaryDark : Element.Color
    , textOnSecondary : Element.Color
    , textOnPrimary: Element.Color
    , primaryLight : Element.Color
    , primary : Element.Color
    , secondary: Element.Color
    , secondaryLight: Element.Color
    }

viewLayout : Model -> Html Msg
viewLayout model =
    Element.layoutWith
        { options = [
            Element.focusStyle {
                backgroundColor = Nothing
                , borderColor = Just model.primaryDark
                , shadow = Nothing
            }
        ]
        }
        [ Element.Background.color model.secondaryDark
        , Element.padding 22
        , Element.Font.color model.textOnSecondary
        ]
        (Element.column []
            [ buttonChangeColors model
            , viewTitle model
            , viewSubtitle model
            , dogImage
            , viewContent
            ]
        )

viewTitle : Model -> Element.Element msg
viewTitle model=
    Element.paragraph
        [ Element.Font.bold
        , Element.Font.color model.primary
        , fontGreatVibes
        , Element.Font.size 52
        , Element.Region.heading 1
        ]
        [ Element.text "My Dog"
        ]

viewSubtitle : Model -> Element.Element msg
viewSubtitle model =
    Element.paragraph
        [ Element.Font.color model.secondaryLight
        , Element.Font.size 16
        , fontTypewriter
        , Element.paddingXY 0 10
        , Element.Region.heading 2
        ]
        [ Element.text "A web page for my dog"
        ]

dogImage : Element.Element Msg
dogImage =
    Element.image
        [ Element.width (Element.maximum 300 Element.fill)
        , Element.centerX
        ]
        { src = "dog.png"
        , description = "A picture of my dog"
        }

buttonChangeColors : Model -> Element.Element Msg
buttonChangeColors model =
    Element.Input.button [
        Element.Background.color model.primaryLight
        , Element.Border.rounded 8
        , Element.Font.color model.secondaryDark
        , Element.alignRight
        , Element.paddingEach { top = 12, right = 12, bottom = 9, left = 12 }
        , Element.Font.size 16
        , Element.Font.bold
        , Element.mouseOver [
            Element.Background.color model.primary
        ]
    ]
    {
        onPress = Just MsgChangeColors
        , label = Element.text "Change colors"
    }

text1 : String
text1 =
    "Bear claw tiramisu candy canes jelly-o pastry lemon drops jelly-o jelly. Sweet roll chupa chups croissant tart sesame snaps sesame snaps. Pie sugar plum jelly beans halvah cake halvah. Gingerbread lemon drops cake macaroon sesame snaps. Croissant candy canes croissant cookie cookie toffee chocolate lemon drops halvah. Pudding caramels jujubes tart chocolate. Bonbon topping lemon drops liquorice chupa chups jelly beans brownie halvah macaroon. Cheesecake cake jelly toffee chocolate cake. Bear claw jujubes pastry chupa chups sugar plum cookie. Chocolate cake cupcake candy canes danish macaroon."

text2 : String
text2 =
    "Toffee marshmallow cake lemon drops chocolate cake cupcake marzipan. Pie pie cheesecake dragée soufflé. Donut tart sweet jelly beans sesame snaps jujubes gummi bears. Halvah cupcake cupcake cookie dragée ice cream icing macaroon jelly beans. Chupa chups pie jelly-o candy canes chocolate bar tiramisu marzipan wafer biscuit. Marshmallow liquorice bonbon shortbread bear claw brownie tootsie roll tart. Toffee lemon drops croissant marzipan chocolate caramels apple pie sweet. Jelly-o brownie jelly icing gingerbread marshmallow brownie jujubes gummi bears."

text3 : String
text3 =
    "Topping cake marshmallow jujubes powder shortbread fruitcake icing dessert. Pie dragée donut bear claw marzipan liquorice danish. Jujubes cake lollipop sweet tiramisu powder dragée lemon drops. Gingerbread candy icing apple pie pudding chupa chups. Wafer jelly-o toffee chocolate cake chocolate bar jelly beans. Bear claw sweet roll macaroon jujubes soufflé. Gummi bears soufflé icing cookie oat cake. Croissant jelly-o marshmallow marzipan chocolate cake cookie cheesecake."

paddingTop : Int -> Element.Attribute msg
paddingTop size =
    Element.paddingEach { top = size, right = 0, bottom = 0, left = 0 }

viewContent : Element.Element msg
viewContent =
    Element.column
        [ fontTypewriter
        , Element.Font.size 16
        , paddingTop 20
        , Element.Region.mainContent
        ]
        [ Element.paragraph
            [ Element.paddingXY 0 20
            ]
            [ Element.text text1
            ]
        , Element.paragraph
            [ Element.paddingXY 0 20
            ]
            [ Element.text text2
            ]
        , Element.paragraph
            [ Element.paddingXY 0 20
            ]
            [ Element.text text3
            ]
        ]
