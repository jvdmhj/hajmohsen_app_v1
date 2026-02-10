import 'package:flutter/material.dart';
import 'package:hajmohsen/models/product.dart';
import 'package:hajmohsen/styles/styles.dart';
import 'package:hajmohsen/users/pages/cart_page.dart';
import 'package:hajmohsen/users/pages/items_detail_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final TextEditingController controller = TextEditingController();
  final FocusNode focusNodeSearchBox = FocusNode();
  String searchText = '';
  bool isGridView = true;
  List<Product> allproducts = [
    //juice
    Product(
      name: 'آب انار',
      title: 'آب انار تازه',
      category: 'ابمیوه',
      price: 80,
      imageAddress: 'assets/images/juicepomegranate.jpeg',
      description:
          'نوشیدنی بسیار مغذی و سرشار از آنتی‌اکسیدان است که آنتی‌اکسیدان‌های آن حدود ۳ برابر بیشتر از چای سبز بوده و به تقویت سیستم ایمنی، سلامت قلب، کاهش فشار خون و بهبود حافظه کمک می‌کند',
    ),
    Product(
      name: 'اب پرتقال',
      title: 'اب پرتقال تازه',
      category: 'ابمیوه',
      price: 70,
      imageAddress: 'assets/images/orangejuice.jpg',
      description:
          'آب پرتقال طبیعی، نوشیدنی مغذی و سرشار از ویتامین C، پتاسیم، فولات و آنتی‌اکسیدان‌ها (فلاونوئیدها) است که سیستم ایمنی را تقویت کرده و به کاهش التهاب کمک می‌کند',
    ),
    Product(
      name: 'اب طالبی',
      title: 'اب طالبی تازه',
      category: 'ابمیوه',
      price: 75,
      imageAddress: 'assets/images/cantaloupejuice.jpg',
      description:
          'آب طالبی یک نوشیدنی تابستانی فوق‌العاده خنک، شیرین و مغذی است که با مخلوط کردن گوشت طالبی رسیده، یخ و در صورت تمایل شکر یا عسل تهیه می‌شود. این نوشیدنی سرشار از پتاسیم، ویتامین A و C بوده و با ۹۰٪ محتوای آب، برای رفع عطش و هیدراتاسیون بدن بسیار مفید است',
    ),
    Product(
      name: 'اب هویج',
      title: 'اب هویج تازه',
      category: 'ابمیوه',
      price: 55,
      imageAddress: 'assets/images/carrotjuice.jpg',
      description:
          'آب هویج نوشیدنی مغذی و خوشمزه‌ای است که سرشار از بتاکاروتن (پیش‌ساز ویتامین A)، ویتامین‌های C و B، پتاسیم و آنتی‌اکسیدان‌ها است و به تقویت سیستم ایمنی، بهبود سلامت چشم و پوست، و کمک به عملکرد کبد و دستگاه گوارش کمک می‌کند. این نوشیدنی به بازیابی عضلات، کنترل فشار خون و سم‌زدایی بدن نیز مفید است و به دلیل ارزش غذایی بالا، در طب سنتی نیز توصیه می‌شود',
    ),
    Product(
      name: 'اب انبه',
      title: 'اب انبه تازه',
      category: 'ابمیوه',
      price: 95,
      imageAddress: 'assets/images/mangojuice.jpg',
      description:
          'آب انبه یک نوشیدنی استوایی، غلیظ و مغذی است که از ترکیب پوره انبه رسیده، آب، یخ و به دلخواه شکر تهیه می‌شود. این نوشیدنی سرشار از ویتامین‌های A، C، E، K و آنتی‌اکسیدان‌ها است که به تقویت سیستم ایمنی، سلامت پوست و رفع گرمازدگی کمک می‌کند',
    ),
    Product(
      name: 'اب کرفس',
      title: 'اب کرفس تازه',
      category: 'ابمیوه',
      price: 80,
      imageAddress: 'assets/images/celeryjuice.jpg',
      description:
          'آب کرفس نوشیدنی کم‌کالری (حدود ۱۶ تا ۴۰ کالری) و سرشار از ویتامین‌های \(K\)، \(C\)، پتاسیم و فولات است که با آبرسانی بالا، کاهش اشتها و سم‌زدایی بدن، به کاهش وزن و سلامت پوست کمک می‌کند [۱، ۴، ۸]. مصرف ناشتای آن التهاب را کاهش داده، فشار خون و کلسترول را مدیریت کرده و به دلیل داشتن ترکیبات ضد سرطان، سیستم ایمنی را تقویت می‌کند',
    ),
    Product(
      name: 'اب هندوانه',
      title: 'اب هندوانه تازه',
      category: 'ابمیوه',
      price: 65,
      imageAddress: 'assets/images/watermelonjuice.jpg',
      description:
          'آب هندوانه نوشیدنی خنک و مغذی تابستانی است که با داشتن ویتامین‌های A و C، پتاسیم و آنتی‌اکسیدان‌هایی مانند لیکوپن، به سلامت قلب، شادابی پوست و افزایش انرژی کمک می‌کند. این نوشیدنی کم‌کالری (حدود ۷۰ کالری در هر فنجان) را می‌توان به‌راحتی با مخلوط‌کن یا آبکش تهیه کرد و برای طعم بهتر با لیموترش یا نعناع سرو کرد',
    ),
    Product(
      name: 'اب سیب',
      title: 'اب سیب تازه',
      category: 'ابمیوه',
      price: 70,
      imageAddress: 'assets/images/applejuice.jpg',
      description:
          'آب سیب عصاره و آب‌میوه سیب است که معمولاً به رنگ زرد است. در این مایع مقدار فراوانی ویتامین، کلسیم، فسفر، سدیم و چند مواد معدنی و مفید دیگر دارد. مزه آن ترش و شیرین است',
    ),
    Product(
      name: 'شیرموز',
      title: 'شیرموز تازه',
      category: 'ابمیوه',
      price: 70,
      imageAddress: 'assets/images/milk&banana.jpg',
      description:
          'شیرموز یک نوشیدنی محبوب و مقوی است که از ترکیب موز، شیر و اغلب شکر یا عسل تهیه می‌شود و با افزودن بستنی، مغزها (پسته، بادام، گردو) یا ثعلب غلیظ و کشدارتر می‌شود و به سبک کافی‌شاپ‌ها یا به صورت رژیمی در خانه قابل تهیه است',
    ),
    Product(
      name: 'شیرخرما',
      title: 'شیرخرما تازه',
      category: 'ابمیوه',
      price: 100,
      imageAddress: 'assets/images/milk&dates.jpg',
      description:
          'شیرخرما یک نوشیدنی مقوی، سالم و انرژی‌زا است که از ترکیب شیر (سرد یا گرم) و خرما تهیه می‌شود. این نوشیدنی سرشار از آهن، کلسیم، پتاسیم و فیبر است که به تقویت استخوان‌ها، رفع خستگی و بهبود عملکرد گوارش کمک کرده و برای صبحانه، میان‌وعده یا افطار بسیار مناسب است',
    ),
    Product(
      name: 'شیر پسته',
      title: 'شیرپسته تازه',
      category: 'ابمیوه',
      price: 110,
      imageAddress: 'assets/images/pistachio&milk.jpg',
      description:
          'شیر پسته یک نوشیدنی سالم، انرژی‌زا و مقوی با رنگ سبز است که از ترکیب پسته، شیر (یا آب)، و شیرین‌کننده‌های طبیعی تهیه می‌شود بارجیل. این نوشیدنی سرشار از آهن، پروتئین و ویتامین است. با مخلوط کردن مغز پسته با شیر، بستنی (برای طعم کافی‌شاپی)، و عسل در مخلوط‌کن، می‌توان یک شیر پسته خانگی خوشمزه و غلیظ تهیه کرد',
    ),
    Product(
      name: 'معجون',
      title: 'معجون تازه',
      category: 'ابمیوه',
      price: 210,
      imageAddress: 'assets/images/potion.jpg',
      description:
          'معجون یک دسر یا میان‌وعده انرژی‌زا و غلیظ است که معمولاً از ترکیب مغزها (پسته، بادام، گردو)، عسل، شیر یا بستنی، و گاهی میوه‌های خشک، خرما و کنجد تهیه می‌شود. این بمب انرژی به دلیل ترکیبات مغذی، منبعی عالی برای افزایش انرژی، تقویت بدن و رفع ضعف است و به عنوان یک نوشیدنی/دسر سالم محبوب شناخته می‌شود',
    ),

    //icecreame
    Product(
      name: 'بستنی قیفی',
      title: 'بستنی قیفی',
      category: 'بستنی',
      price: 45,
      imageAddress: 'assets/images/icecream2.jpg',
      description:
          'بستنی قیفی (Ice cream cone) دسری محبوب و قابل حمل است که از ترکیب یک اسکوپ یا فرم بستنی (مانند وانیلی، شکلاتی، زعفرانی) درون یک نان مخروطی ترد و شیرین (وافل، ویفر یا شکری) تشکیل شده است',
    ),
    Product(
      name: 'بستنی لیوانی',
      title: 'بستنی لیوانی',
      category: 'بستنی',
      price: 75,
      imageAddress: 'assets/images/simpleicecreamglass.jpg',
      description:
          'بستنی لیوانی نوعی بستنی تک‌نفره و پرطرفدار است که در بسته‌بندی‌های کوچک (معمولاً ۵۰ تا ۱۳۵ گرمی) عرضه می‌شود. این محصول در طعم‌های وانیلی، شکلاتی، زعفرانی (سنتی)، میوه‌ای و با سس‌های مختلف تولید شده و به دلیل سهولت در حمل و مصرف، گزینه‌ای مناسب برای میان‌وعده است',
    ),
    Product(
      name: 'بستنی اسکوپی',
      title: 'بستنی اسکوپی',
      category: 'بستنی',
      price: 45,
      imageAddress: 'assets/images/escope.jpg',
      description:
          'بستنی اسکوپی نوعی بستنی متنوع و محبوب است که به دلیل تنوع طعم (زعفرانی، کاکائویی، میوه‌ای و...) و قدرت انتخاب بالا، در ظرف یا نان‌های مخروطی عرضه می‌شود. هر رنگ در این بستنی‌ها معمولاً نشان‌دهنده یک طعم خاص است که تجربه مصرف‌کننده را شخصی‌سازی می‌کند. این بستنی به دلیل بافت کرمی و قابلیت ترکیب طعم‌های مختلف، طرفداران زیادی دارد',
    ),
    Product(
      name: 'بستنی کیلویی دستگاهی',
      title: 'بستنی کیلویی دستگاهی',
      category: 'بستنی',
      price: 200,
      imageAddress: 'assets/images/simpleicecreamglass.jpg',
      description:
          'بستنی کیلویی دستگاهی (سافت) یک نوع بستنی قیفی یا مخزنی با بافت نرم و لطیف است که توسط دستگاه‌های بستنی‌ساز صنعتی به‌صورت تازه تولید می‌شود. این بستنی‌ها معمولاً از مخلوط شیر، شکر، خامه و طعم‌دهنده‌ها ساخته شده و با خروجی پیوسته، قابلیت سرو سریع به صورت کیلویی (برای مجالس و بیرون‌بر) یا قیفی را دارند و به‌دلیل هوادهی بالا، بافتی سبک دارند',
    ),
    Product(
      name: 'بستنی کیلویی اسکوپی',
      title: 'بستنی کیلویی اسکوپی',
      category: 'بستنی',
      price: 350,
      imageAddress: 'assets/images/glassicecream.jpg',
      description:
          'بستنی اسکوپی نوعی بستنی متنوع و محبوب است که به دلیل تنوع طعم (زعفرانی، کاکائویی، میوه‌ای و...) و قدرت انتخاب بالا، در ظرف یا نان‌های مخروطی عرضه می‌شود. هر رنگ در این بستنی‌ها معمولاً نشان‌دهنده یک طعم خاص است که تجربه مصرف‌کننده را شخصی‌سازی می‌کند. این بستنی به دلیل بافت کرمی و قابلیت ترکیب طعم‌های مختلف، طرفداران زیادی دارد',
    ),

    //shake
    Product(
      name: 'شیک وانیل',
      title: 'شیک وانیل',
      category: 'شیک',
      price: 175,
      imageAddress: 'assets/images/vanilla.jpg',
      description:
          'میلک‌شیک وانیلی یک نوشیدنی سرد و شیرین است که از ترکیب بستنی وانیلی، شیر و گاهی یخ تهیه می‌شود. این نوشیدنی پرطرفدار در هر ۱۰۰ گرم حدود ۱۴۰ کیلوکالری انرژی، ۱۸ تا ۲۷ گرم قند و ۳ تا ۹ گرم چربی دارد. وانیل، طعم‌دهنده اصلی آن، از غلاف گیاهان ثعلبیان تهیه می‌شود که گران‌قیمت‌ترین ادویه پس از زعفران است',
    ),
    Product(
      name: 'شیک شکلات',
      title: 'شیک شکلات',
      category: 'شیک',
      price: 185,
      imageAddress: 'assets/images/chocolate.jpg',
      description:
          'میلک‌شیک شکلاتی یک نوشیدنی سرد و شیرین است که از ترکیب بستنی (معمولاً وانیلی یا شکلاتی)، شیر و سس یا پودر شکلات با استفاده از مخلوط‌کن تهیه می‌شود. این نوشیدنی که در اوایل قرن بیستم در آمریکا ابداع شد، انرژی بالایی دارد و معمولاً حاوی حدود \(\) کیلوکالری انرژی در هر \(\) گرم است',
    ),
    Product(
      name: 'میوه ای',
      title: 'شیک میوه ای',
      category: 'شیک',
      price: 195,
      imageAddress: 'assets/images/fruitshake.jpg',
      description:
          'میلک‌ شیک (Milkshake) یک نوشیدنی شیرین و خنک است که بر پایه شیر، بستنی (یا آیس میلک) و طعم‌دهنده‌ها یا میوه‌های تازه تهیه می‌شود. این نوشیدنی خاستگاهی آمریکایی داشته و از اوایل قرن بیستم میلادی محبوب شد. میلک‌شیک میوه‌ای مانند توت‌فرنگی اغلب با خامه زده‌شده تزئین می‌شود',
    ),
    Product(
      name: 'شیک کره بادام',
      title: 'شیک کره بادام',
      category: 'شیک',
      price: 200,
      imageAddress: 'assets/images/Peanutbutter.jpg',
      description:
          'شیک کره بادام (معمولاً بادام زمینی) یک نوشیدنی غلیظ و مغذی است که از ترکیب کره بادام، شیر، بستنی (یا یخ) و گاهی شیرین‌کننده‌ها تهیه می‌شود. این نوشیدنی سرشار از پروتئین بوده و به عنوان یک اسموتی یا دسر پرانرژی شناخته می‌شود که با افزودن موادی مثل خامه یا بادام خردشده تزئین می‌گردد',
    ),
    Product(
      name: 'شیک نوتلا',
      title: 'شیک نوتلا',
      category: 'شیک',
      price: 200,
      imageAddress: 'assets/images/Nutella.jpg',
      description:
          'شیک نوتلا (Nutella Shake) یک نوشیدنی سرد و غلیظ است که با ترکیب اصلی نوتلا (کرم شکلات فندقی ساخت ایتالیا)، شیر و بستنی وانیلی تهیه می‌شود. این دسر محبوب با مخلوط کردن این مواد، به همراه خامه، فندق و شکلات آب‌شده تزئین شده و یک میان‌وعده انرژی‌زا و پرطرفدار محسوب می‌شود',
    ),
    Product(
      name: 'شیک لوتوس',
      title: 'شیک لوتوس',
      category: 'شیک',
      price: 220,
      imageAddress: 'assets/images/LotusBiscuits.jpg',
      description:
          'شیک لوتوس یک میلک‌شیک خامه‌ای و محبوب است که از ترکیب بستنی وانیلی، شیر، و بیسکویت کاراملی لوتوس (Speculoos) تهیه می‌شود. این نوشیدنی خوشمزه به دلیل طعم کاراملی و بافت خاص بیسکویت‌های لوتوس که از بلژیک سرچشمه می‌گیرند، شناخته شده است و معمولاً با کرم لوتوس و بیسکویت خرد شده تزیین می‌شود',
    ),

    //sandwich
    Product(
      name: 'سوسیس سیب زمینی',
      title: 'ساندویچ سوسیس سیب زمینی',
      category: 'ساندویچ',
      price: 90,
      imageAddress: 'assets/images/Sausage&potatoSandwich.jpg',
      description:
          'ساندویچ سوسیس سیب‌زمینی یک غذای سریع و محبوب ایرانی است که از ترکیب سوسیس سرخ‌شده، سیب‌زمینی مکعبی یا خلالی، پیاز و ادویه تهیه می‌شود. این ساندویچ معمولاً با سس قرمز یا خردل و خیارشور سرو می‌شود. نوع تند آن با رب گوجه‌فرنگی به عنوان «سوسیس بندری» شناخته می‌شود',
    ),
    Product(
      name: 'سوسیس بندری',
      title: 'ساندویچ سوسیس بندری',
      category: 'ساندویچ',
      price: 110,
      imageAddress: 'assets/images/portsusage.jpg',
      description:
          'سوسیس بندری یک غذای تند و محبوب ایرانی، به ویژه در مناطق جنوبی، است که با سوسیس، پیاز فراوان، رب گوجه‌فرنگی، و ادویه‌جات (کاری و فلفل قرمز زیاد) تهیه می‌شود. این خوراک نیمه‌فوری که ریشه در استان خوزستان دارد، معمولاً با نان ساندویچی، سیب‌زمینی (اختیاری) و سس تند سرو می‌شود',
    ),
    Product(
      name: 'سوسیس آلمانی',
      title: 'ساندویچ سوسیس آلمانی',
      category: 'ساندویچ',
      price: 80,
      imageAddress: 'assets/images/germansusage.jpg',
      description:
          'ساندویچ سوسیس آلمانی (Wurstbrot/Wurstsemmel) ترکیبی ساده از سوسیس‌های متنوع آلمانی، نان تازه (رول) و خردل است. انواع معروف شامل Bratwurst (سرخ شده) در نان (Bratwurstbrötchen) یا سوسیس‌های دودی در نان (Weggli) است [۳]. یکی از نمونه‌های سنتی آن, Drei im Weckla است که شامل سه سوسیس کوچک نورنبرگر در نان است',
    ),
    Product(
      name: 'جگر مرغ',
      title: 'ساندویچ جگر مرغ',
      category: 'ساندویچ',
      price: 110,
      imageAddress: 'assets/images/liver.jpg',
      description:
          'ساندویچ جگر مرغ یک غذای فوری و سنتی است که با تفت دادن جگر مرغ همراه با پیاز، رب گوجه‌فرنگی و ادویه‌جات (مانند زردچوبه، نمک، فلفل و گاهی دارچین) تهیه می‌شود. این خوراک معمولاً داخل نان باگت یا نان بولکی به همراه خیارشور، گوجه‌فرنگی، جعفری و گاهی سیب‌زمینی سرخ‌کرده سرو می‌شود که به دلیل طعم قوی و قیمت مناسب، محبوبیتی خاص دارد',
    ),
    Product(
      name: 'مرغ',
      title: 'ساندویچ مرغ',
      category: 'ساندویچ',
      price: 150,
      imageAddress: 'assets/images/chickensnadwich.jpg',
      description:
          'ساندویچ مرغ غذایی محبوب و سالم شامل سینه یا ران مرغ (معمولاً بدون استخوان و پوست) بین نان است که با کاهو، گوجه‌فرنگی و سس‌هایی مانند مایونز یا خردل سرو می‌شود. این ساندویچ به شکل‌های مختلفی نظیر گریل، سوخاری، گرم یا سالاد مرغ تهیه شده و گاهی با پنیرهایی مثل چدار یا سوئیسی و بیکن ترکیب می‌شود',
    ),
    Product(
      name: 'همبرگر معمولی',
      title: 'ساندویچ همبرگر معمولی',
      category: 'ساندویچ',
      price: 100,
      imageAddress: 'assets/images/simpleburger.jpg',
      description:
          'همبرگر یک ساندویچ شامل یک قرص گوشت (عمدتاً گاو) است که گریل یا سرخ شده و داخل نان سرو می‌شود. معمولاً با کاهو، پیاز، گوجه، سس (مایونز/خردل) و گاهی پنیر (چیزبرگر) همراه است. این غذا از شهر هامبورگ آلمان ریشه گرفته و معمولاً با سیب‌زمینی سرخ‌کرده سرو می‌شود',
    ),
    Product(
      name: 'همبرگر مخصوص',
      title: 'ساندویچ همبرگر مخصوص',
      category: 'ساندویچ',
      price: 115,
      imageAddress: 'assets/images/specialburger.jpg',
      description:
          'ساندویچ همبرگر شامل یک لایه گوشت چرخ‌کرده (معمولاً گاو) است که گریل یا سرخ شده و داخل نان گرد سرو می‌شود. این غذا ریشه در هامبورگ آلمان دارد، اما به عنوان نماد فست‌فود آمریکایی شناخته می‌شود. نمونه‌های مخصوص اغلب با پنیر (چیزبرگر)، کاهو، گوجه، پیاز، خیارشور و سس‌های مختلف ترکیب می‌شوند',
    ),
    Product(
      name: 'چیزبرگر معمولی',
      title: 'ساندویچ چیزبرگر معمولی',
      category: 'ساندویچ',
      price: 135,
      imageAddress: 'assets/images/simpleburger.jpg',
      description:
          'چیزبرگر یک ساندویچ شامل یک قرص گوشت (عمدتاً گاو) است که گریل یا سرخ شده و پنیر است که داخل نان سرو می‌شود. معمولاً با کاهو، پیاز، گوجه، سس (مایونز/خردل) و گاهی پنیر (چیزبرگر) همراه است. این غذا از شهر هامبورگ آلمان ریشه گرفته و معمولاً با سیب‌زمینی سرخ‌کرده سرو می‌شود',
    ),
    Product(
      name: 'چیزبرگر مخصوص',
      title: 'ساندویچ چیزبرگر مخصوص',
      category: 'ساندویچ',
      price: 155,
      imageAddress: 'assets/images/specialburger.jpg',
      description:
          'چیزبرگر یک ساندویچ شامل یک قرص گوشت (عمدتاً گاو) است که گریل یا سرخ شده و پنیر است که داخل نان سرو می‌شود. معمولاً با کاهو، پیاز، گوجه، سس (مایونز/خردل) و گاهی پنیر (چیزبرگر) همراه است. این غذا از شهر هامبورگ آلمان ریشه گرفته و معمولاً با سیب‌زمینی سرخ‌کرده سرو می‌شود',
    ),
    Product(
      name: 'فلافل',
      title: 'ساندویچ فلافل',
      category: 'ساندویچ',
      price: 95,
      imageAddress: 'assets/images/falafel.jpg',
      description:
          'ساندویچ فلافل، غذای خیابانی محبوب خاورمیانه‌ای، شامل توپک‌های سرخ‌شده نخود یا باقلا (در مصر) است که درون نان پیتا یا صمون قرار می‌گیرد. این غذا با چاشنی‌های تند، سس ارده، ترشی (مانند شلغم صورتی) و سالاد سبزیجات (گوجه و جعفری) سرو می‌شود [۲، ۳]. فلافل منبع عالی پروتئین و جایگزین گیاهی محبوب برای گوشت است',
    ),
    Product(
      name: 'رویال برگر',
      title: 'ساندویچ رویال برگر',
      category: 'ساندویچ',
      price: 155,
      imageAddress: 'assets/images/royalburger.jpg',
      description: '',
    ),
    Product(
      name: 'هات داگ',
      title: 'ساندویچ هات داگ',
      category: 'ساندویچ',
      price: 140,
      imageAddress: 'assets/images/hotdog.jpg',
      description:
          'رویال برگر یک ساندویچ پرملات و محبوب (نسخه شاهانه همبرگر) است که از گوشت چرخ‌کرده گاو (گریل یا سرخ شده)، پنیر ورقه ای (معمولاً گودا)، ژامبون (بیکن) و قارچ تهیه می‌شود. این ساندویچ به دلیل ترکیبات غنی، بسیار پرکالری بوده و به عنوان یک غذای سریع و خوشمزه شناخته می‌شود',
    ),
    Product(
      name: 'کوکتل',
      title: 'ساندویچ کوکتل',
      category: 'ساندویچ',
      price: 120,
      imageAddress: 'assets/images/cocktail.jpg',
      description:
          'ساندویچ کوکتل یک نوع ساندویچ سوسیس پرطرفدار است که با استفاده از سوسیس کوکتل (سوسیس‌های کوچک) تهیه می‌شود. این ساندویچ معمولاً به صورت گرم، همراه با نان باگت، خیارشور، گوجه‌فرنگی و انواع سس سرو می‌شود. سوسیس کوکتل خود ترکیبی از گوشت، چربی، ادویه، نمک، نیتریت سدیم و گاهی پنیر پیتزا است که ارزش غذایی حدود ۲۰۰ کیلوکالری در هر ۱۰۰ گرم دارد',
    ),
  ];
  List<String> categories = ['همه', 'ابمیوه', 'بستنی', 'شیک', 'ساندویچ'];
  String selectedCategory = 'همه';

  List<Product> get fillteredProduct {
    return allproducts.where((product) {
      final matchCategory =
          selectedCategory == 'همه' || product.category == selectedCategory;
      final matchSearch = product.name.toLowerCase().contains(
        searchText.toLowerCase(),
      );
      return matchCategory && matchSearch;
    }).toList();
  }

  @override
  void dispose() {
    controller.dispose();
    focusNodeSearchBox.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 245, 230),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.menu),
          ),
        ),

        actions: [
          Padding(
            padding: EdgeInsets.only(left: size.width * 0.01),
            child: IconButton(
              onPressed: () {
                setState(() {
                  isGridView = !isGridView;
                });
              },
              icon: Icon(
                isGridView ? Icons.view_list_rounded : Icons.grid_view_rounded,
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.amber),
              child: Text(
                'منو',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: const Text('سبد خرید'),
              onTap: () {
                Navigator.pop(context); // اول Drawer بسته شود
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const CartPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: const Color.fromARGB(255, 255, 245, 230),
              expandedHeight: size.height * 0.34,
              pinned: false,
              floating: false,
              automaticallyImplyLeading: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: EdgeInsets.only(
                    top: size.height * 0.12,
                    right: size.width * 0.05,
                    left: size.width * 0.05,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'همراه هر لحظه، یک طعم',
                          style: TextStyle(
                            fontFamily: 'Besmellah',
                            fontSize: size.width * 0.065,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      SizedBox(height: size.height * 0.01),

                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'هر فصل، با طعم‌های تازه خودش ازت پذیرایی می‌کنیم',
                          style: TextStyle(
                            fontFamily: 'Kayrawan',
                            fontSize: size.width * 0.035,
                          ),
                        ),
                      ),

                      SizedBox(height: size.height * 0.03),

                      TextField(
                        controller: controller,
                        onChanged: (value) {
                          setState(() {
                            searchText = value;
                          });
                        },
                        focusNode: focusNodeSearchBox,
                        textDirection: TextDirection.ltr,
                        style: regularLatin(context),
                        cursorColor: Color(0XFF1B1B1E),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'جستجو',
                          hintStyle: hintTextStyle(context),
                          prefixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                searchText = controller.text;
                              });
                            },
                            icon: Icon(Icons.search),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.close),
                            onPressed: () {
                              controller.clear();
                              setState(() {
                                searchText = '';
                              });
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),

                      SizedBox(height: size.height * 0.025),

                      SizedBox(
                        height: size.height * 0.05,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            final category = categories[index];
                            final isSelected = selectedCategory == category;

                            return Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.02,
                              ),
                              child: ChoiceChip(
                                showCheckmark: false,
                                label: Text(
                                  category,
                                  style: TextStyle(
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.black,
                                    fontFamily: 'BNazanin',
                                  ),
                                ),
                                selected: isSelected,
                                onSelected: (_) {
                                  setState(() {
                                    selectedCategory = category;
                                  });
                                },
                                selectedColor: Colors.orangeAccent,
                                backgroundColor: Colors.white,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: isGridView
                  ? SliverGrid(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        final product = fillteredProduct[index];
                        return girdItemCard(context, product);
                      }, childCount: fillteredProduct.length),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            childAspectRatio: 0.75,
                          ),
                    )
                  : SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        final product = fillteredProduct[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: listItemCard(context, product),
                        );
                      }, childCount: fillteredProduct.length),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget girdItemCard(BuildContext context, Product product) {
  final size = MediaQuery.of(context).size;
    String toPersianNumber(num input) {
    final english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    final persian = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];
    String result = input.toString();
    for (int i = 0; i < english.length; i++) {
      result = result.replaceAll(english[i], persian[i]);
    }
    return result;
  }
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => ItemsDetailPage(product: product)),
      );
    },
    child: Card(
      color: const Color.fromARGB(255, 255, 245, 230),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: EdgeInsets.all(size.width * 0.01),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  product.imageAddress,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Center(
              child: Text(
                product.name,
                style: const TextStyle(fontFamily: 'BNazanin'),
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Center(
              child: Text(
                '${toPersianNumber(product.price)} هزار تومان',
                style: const TextStyle(
                  fontFamily: 'BNazanin',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget listItemCard(BuildContext context, Product product) {
  final size = MediaQuery.of(context).size;
  String toPersianNumber(num input) {
    final english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    final persian = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];
    String result = input.toString();
    for (int i = 0; i < english.length; i++) {
      result = result.replaceAll(english[i], persian[i]);
    }
    return result;
  }

  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => ItemsDetailPage(product: product)),
      );
    },
    child: Card(
      margin: EdgeInsets.zero,
      color: const Color.fromARGB(255, 255, 245, 230),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: EdgeInsets.all(size.width * 0.025),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                product.imageAddress,
                width: size.width * 0.25,
                height: size.width * 0.25,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: size.width * 0.04),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontFamily: 'BNazanin',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    product.title,
                    style: const TextStyle(
                      fontFamily: 'BNazanin',
                      fontSize: 13,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '${toPersianNumber(product.price)} هزار تومان',
                    style: const TextStyle(
                      fontFamily: 'BNazanin',
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
